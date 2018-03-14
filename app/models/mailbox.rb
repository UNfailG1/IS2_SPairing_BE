class Mailbox < ApplicationRecord
  has_one :mail_sender, class_name: 'PlayerProfile', foreign_key: 'id'
  has_one :mail_recever, class_name: 'PlayerProfile', foreign_key: 'id'
  has_many :attachments, as: :attachable

  validates :mail_message, presence: true
end
