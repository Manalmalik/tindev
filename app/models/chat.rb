 class Chat < ApplicationRecord
  belongs_to :receiver
  belongs_to :sender
end
