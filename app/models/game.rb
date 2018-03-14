class Game < ApplicationRecord
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :platforms
  has_many :sub_forums
  has_many :player_game_profiles

  validates :gam_name, presence: true
  validates :gam_description, presence: true
  validates :gam_link, presence: true

end
