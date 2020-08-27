class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    @messages = Message.all.where(id: current_user.id)
    @chats = policy_scope(Chat)
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
    redirect_to chat_path(@chat)
  end
end
