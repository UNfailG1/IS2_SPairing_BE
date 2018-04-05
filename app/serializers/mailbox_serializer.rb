class MailboxSerializer < ActiveModel::Serializer
  belongs_to :sender
  belongs_to :receiver
end
