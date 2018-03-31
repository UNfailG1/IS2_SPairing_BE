# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  thread_forum_id   :integer
#  player_profile_id :integer
#  com_comment       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
