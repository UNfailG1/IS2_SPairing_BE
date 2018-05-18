# == Schema Information
#
# Table name: games
#
#  id               :integer          not null, primary key
#  gam_name         :string
#  gam_description  :text
#  gam_link         :string
#  gam_image        :string
#  gam_user_counter :integer
#  gam_views        :integer
#  gam_rate_igdb    :decimal(, )
#  gam_rate_players :decimal(, )
#  pegi_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_games_on_pegi_id  (pegi_id)
#

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
