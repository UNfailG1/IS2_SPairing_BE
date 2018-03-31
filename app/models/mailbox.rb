class Mailbox < ApplicationRecord
  belongs_to :sender , class_name: "PlayerProfile"
  belongs_to :receiver, class_name: "PlayerProfile"

  validates :mail_message, presence: true

  #Queries

  #Search for mails of a PlayerProfile username
  #If more than one PlayerProfile have the same Username, is
  #returned mails of the first found
  #param name may be a string
  def self.getByPlayerProfileName(username)
    Mailbox.where(sender: PlayerProfile.getFirstByUsername(username)) + Mailbox.where(receiver: PlayerProfile.getFirstByUsername(username))
  end
end
