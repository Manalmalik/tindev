class ChatsController < ApplicationController
  def index
    @chats = filtered(policy_scope(Chat))
    @tickets = Ticket.where(user_id: params[:format])
    @messages = Message.where(id: current_user.id)
    # raise
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
    @chat.ticket = Ticket.find(params[:ticket_id])
    authorize @chat
    @chat.save
    redirect_to category_ticket_chat_path(params[:category_id], params[:ticket_id], @chat)
  end
private
  def filtered(chats)
    chats_sent = chats.where(sender_id: params[:format])
    chats_received = chats.where(receiver_id: params[:format])
    @chats = chats_received + chats_sent
  end

end
