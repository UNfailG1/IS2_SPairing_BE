class PlayerGameProfile < ApplicationRecord
  belongs_to :game
  belongs_to :player_profile

  validates :pgp_reputation, presence: true
  validates :pgp_nickname, presence: true
  validates :pgp_rate, presence: true
end
