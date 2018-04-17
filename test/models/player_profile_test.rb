# == Schema Information
#
# Table name: player_profiles
#
#  id              :integer          not null, primary key
#  pp_username     :string
#  password_digest :string
#  email           :string
#  pp_spairing_elo :float
#  pp_googleId     :string
#  location_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_player_profiles_on_location_id  (location_id)
#

require 'test_helper'

class PlayerProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
