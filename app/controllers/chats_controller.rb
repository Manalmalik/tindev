class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    authorize @chat
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
    authorize @chat
  end

  def create
    @chat = Chat.new
    @receiver = User.find(params[:id])
    @sender = current_user
    @chat.receiver = @receiver
    @chat.sender = @sender
    authorize @chat
    @chat.save
    redirect_to chat_path(@chat)
  end
end
