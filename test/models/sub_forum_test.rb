# == Schema Information
#
# Table name: sub_forums
#
#  id             :integer          not null, primary key
#  sf_name        :string
#  sf_description :text
#  game_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_sub_forums_on_game_id  (game_id)
#

require 'test_helper'

class SubForumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
