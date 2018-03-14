class Location < ApplicationRecord
  belongs_to :player_profile

  validates :loc_lat, presence: true
  validates :loc_lon, presence: true
  validates :loc_name, presence: true
end
