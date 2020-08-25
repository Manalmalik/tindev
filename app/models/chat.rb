 class Chat < ApplicationRecord
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"

  has_many :message, dependent: :destroy
end
