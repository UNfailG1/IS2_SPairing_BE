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
# Indexes
#
#  index_player_game_profiles_on_game_id            (game_id)
#  index_player_game_profiles_on_player_profile_id  (player_profile_id)
#

class PlayerGameProfile < ApplicationRecord
  belongs_to :game
  belongs_to :player_profile

  validates :pgp_reputation, presence: true
  validates :pgp_nickname, presence: true
  validates :pgp_rate, presence: true

end
