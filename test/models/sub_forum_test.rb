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

require 'test_helper'

class SubForumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
