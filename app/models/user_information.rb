class UserInformation < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  validates :github, uniqueness: :true
end
