class Mailbox < ApplicationRecord
  belongs_to :sender , class_name: "PlayerProfile"
  belongs_to :receiver, class_name: "PlayerProfile"

  validates :mail_message, presence: true
end
