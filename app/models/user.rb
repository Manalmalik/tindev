class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :chats, through: :messages

  validates :username, presence: true, uniqueness: true
  validates :online, default: false
end
