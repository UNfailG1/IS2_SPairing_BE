class Location < ApplicationRecord
  has_many :player_profiles, dependent: :nullify

  validates :loc_lat, presence: true
  validates :loc_long, presence: true
  validates :loc_name, presence: true
end
