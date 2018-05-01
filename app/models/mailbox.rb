# == Schema Information
#
# Table name: mailboxes
#
#  id           :integer          not null, primary key
#  sender_id    :integer
#  receiver_id  :integer
#  mail_message :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Mailbox < ApplicationRecord
  belongs_to :sender , class_name: "PlayerProfile"
  belongs_to :receiver, class_name: "PlayerProfile"

  validates :mail_message, presence: true

  #Queries

  #Search for mails of a PlayerProfile username
  #If more than one PlayerProfile have the same Username, is
  #returned mails of the first found
  #param name may be a string
  def self.getByPlayerProfileName(id)
    Mailbox.where(receiver_id: id)
  end
end
