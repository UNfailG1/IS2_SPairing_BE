# == Schema Information
#
# Table name: player_white_lists
#
#  id                       :integer          not null, primary key
#  player_friend_sender_id  :integer
#  player_friend_recever_id :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'test_helper'

class PlayerWhiteListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
