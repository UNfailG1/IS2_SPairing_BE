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

  #Get count of mails sent on a given day
  #Param day is a date that represents the of the querie
  def self.getMailsCountDay(day)
    getMailsBetweenDates(day, day).count
  end

  #Get mails sent on a intervale of time
  #Param start_date is a date that represents the first date to begin the querie
  #Param end_date is a date that represents is the last date to end the querie
  def self.getMailsBetweenDates(start_date, end_date)
    where(:created_at => start_date.beginning_of_day..end_date.end_of_day)
  end

  #Get statistic users registered on a intervale of time, per days
  #Param start_date is a date that represents the first date to begin the querie
  #Param end_date is a date that represents is the last date to end the querie
  def self.getMailsBetweenDatesPerDay(start_date, end_date)
    getMailsBetweenDatesPerUnit(start_date, end_date, 1.day)
  end

  #Get statistic users registered on a intervale of time, per months
  #Param start_date is a date that represents the first date to begin the querie
  #Param end_date is a date that represents is the last date to end the querie
  def self.getMailsBetweenDatesPerMonth(start_date, end_date)
    getMailsBetweenDatesPerUnit(start_date, end_date, 1.months)
  end

  #Get statistic users registered on a intervale of time, per unit of time
  #Param start_date is a date that represents the first date to begin the querie
  #Param end_date is a date that represents is the last date to end the querie
  #param unit is the amount of time to be counted
  def self.getMailsBetweenDatesPerUnit(start_date, end_date, unit)
    answer = {}
    while start_date <= end_date
      answer[start_date] = getMailsCountDay(start_date)
      start_date = start_date + unit
    end
    answer
  end
end
