# == Schema Information
#
# Table name: player_black_lists
#
#  id         :integer          not null, primary key
#  blocker_id :integer
#  blocked_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PlayerBlackListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
