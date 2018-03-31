# == Schema Information
#
# Table name: player_profiles
#
#  id              :integer          not null, primary key
#  pp_username     :string
#  pp_password     :string
#  pp_email        :string
#  pp_spairing_elo :float
#  location_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class PlayerProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
