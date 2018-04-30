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
  def self.getByPlayerProfileName(username)
    Mailbox.where(sender: PlayerProfile.getFirstByUsername(username)) + Mailbox.where(receiver: PlayerProfile.getFirstByUsername(username))
  end

  #Get count of mails sent on a given day
  #Param day is a date that represents the of the querie
  def self.getMailCountDay(day)
    getUsersBetweenDates(day, day).count
  end

  #Get mails sent on a intervale of time
  #Param start_date is a date that represents the first date to begin the querie
  #Param end_date is a date that represents is the last date to end the querie
  def self.getUsersBetweenDates(start_date, end_date)
    where(:created_at => start_date.beginning_of_day..end_date.end_of_day)
  end
end
