class MessagesController < ApplicationController
skip_before_action :verify_authenticity_token

  def create
    @chat = Chat.find(params[:chat_id])
    @two_possible_users = [@chat.sender, @chat.receiver]
    @message = Message.new(message_params)
    @message.chat = @chat
    @message.user = current_user
    authorize @message
    @message.save
    notify_channels
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def receiving_message
    if current_user == @two_possible_users[0]
      @two_possible_users[1]
    elsif current_user == @two_possible_users[1]
      @two_possible_users[0]
    end
  end

  def notify_channels
    ChatChannel.broadcast_to(
      @chat,
      render_to_string(partial: "message", locals: { message: @message })
    )
    ActionCable.server.broadcast("notifications:#{receiving_message.id}", {})
  end
end
