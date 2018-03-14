class PlayerGameProfile < ApplicationRecord
  belongs_to :player_profiles
  belongs_to :games

  validates :player_reputation, presence: true
  validates :player_nickname, presence: true
  validates :player_game_rate, presence: true

end
