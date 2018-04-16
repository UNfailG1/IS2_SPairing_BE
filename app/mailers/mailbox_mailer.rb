class MailboxMailer < ApplicationMailer

  def message_received message
    @url = @@url
    @sender = message.sender
    @receiver = message.receiver
    @message = message.mail_message
    mail  to: @receiver.email,
          subject: "You have a new message"
  end
end
