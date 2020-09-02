class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :chats_as_sender, :class_name => 'Chat', :foreign_key => 'sender_id', dependent: :destroy
  has_many :chats_as_receiver, :class_name => 'Chat', :foreign_key => 'receiver_id', dependent: :destroy
  has_one :user_information, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  before_create :add_user_information

  def chats
    chats_as_sender + chats_as_receiver
  end

  private

  def add_user_information
    @user_info = UserInformation.new
    self.user_information = @user_info
  end
end
