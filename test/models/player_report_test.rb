# == Schema Information
#
# Table name: player_reports
#
#  id          :integer          not null, primary key
#  sender_id   :integer
#  receiver_id :integer
#  pr_reasons  :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PlayerReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
