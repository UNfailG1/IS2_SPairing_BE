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

require 'test_helper'

class MailboxTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
