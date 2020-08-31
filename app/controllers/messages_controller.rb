class MessagesController < ApplicationController
skip_before_action :verify_authenticity_token

  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(message_params)
    @message.chat = @chat
    @message.user = current_user
    authorize @message
    if @message.save
      ChatChannel.broadcast_to(
        @chat,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to category_ticket_chat_path(@chat, anchor: "message-#{@message.id}")
    else
      render category_ticket_chat_path(@chat)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
