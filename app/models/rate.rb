# == Schema Information
#
# Table name: rates
#
#  id                     :integer          not null, primary key
#  rate_rate              :float
#  player_game_profile_id :integer
#  player_profile_id      :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Rate < ApplicationRecord
    belongs_to :player_game_profile
    belongs_to :player_profile

    validates :rate_rate, presence: true
end
