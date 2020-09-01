class Ticket < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :chats, dependent: :destroy
  validates :description, presence: true
  validates :category, presence: true
  validates :title, presence: true
end
