 class Chat < ApplicationRecord
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"
  belongs_to :ticket

  has_many :messages, dependent: :destroy
end
