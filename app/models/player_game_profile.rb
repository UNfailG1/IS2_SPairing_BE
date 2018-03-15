class PlayerGameProfile < ApplicationRecord
  belongs_to :player_profile
  belongs_to :game

  validates :player_reputation, presence: true
  validates :player_nickname, presence: true
  validates :player_game_rate, presence: true

end
