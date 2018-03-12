class Location < ApplicationRecord
  validate :loc_lat, presence: true
  validate :loc_lon, presence: true
  validate :loc_name, presence: true
end
