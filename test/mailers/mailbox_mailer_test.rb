require 'test_helper'

class MailboxMailerTest < ActionMailer::TestCase
  test "message_received" do
    mail = MailboxMailer.message_received
    assert_equal "Message received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
