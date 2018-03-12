class PlayerGameProfile < ApplicationRecord
  belongs_to :PlayerProfile
  belongs_to :Game

  validates :player_reputation, presence: true
  validates :player_nickname, presence: true
  validates :player_game_rate, presence: true
  
end
