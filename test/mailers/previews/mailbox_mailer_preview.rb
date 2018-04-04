# Preview all emails at http://localhost:3000/rails/mailers/mailbox_mailer
class MailboxMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mailbox_mailer/message_received
  def message_received
    MailboxMailer.message_received
  end

end
