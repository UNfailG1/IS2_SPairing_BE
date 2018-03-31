# == Schema Information
#
# Table name: player_game_profiles
#
#  id                :integer          not null, primary key
#  pgp_reputation    :float
#  pgp_nickname      :string
#  pgp_rate          :float
#  game_id           :integer
#  player_profile_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class PlayerGameProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
