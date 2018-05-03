# == Schema Information
#
# Table name: mailboxes
#
#  id           :integer          not null, primary key
#  sender_id    :integer
#  receiver_id  :integer
#  mail_subject :string
#  mail_message :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class MailboxSerializer < ActiveModel::Serializer
  attributes :id, :mail_message, :mail_subject

  belongs_to :sender
  belongs_to :receiver
end
