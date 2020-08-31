class ChatsController < ApplicationController
  def index
    @chats = filtered(policy_scope(Chat))
    @messages = Message.where(id: current_user.id)
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
    authorize @chat
  end

  def create
    @chat = Chat.new
    @receiver = User.find(params[:ticket_owner])
    @sender = current_user
    @chat.receiver = @receiver
    @chat.sender = @sender
    authorize @chat
    @chat.save
    redirect_to category_ticket_chat_path(params[:category_id], params[:ticket_id], @chat)
  end
private
  def filtered(chats)
    chats_sent = chats.where(sender_id: params[:user_id])
    chats_received = chats.where(receiver_id: params[:user_id])
    @chats = chats_received + chats_sent
    # authorize @chats
  end

end
