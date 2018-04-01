class Location < ApplicationRecord
  has_many :player_profiles, dependent: :nullify

  validates :loc_lat, presence: true
  validates :loc_long, presence: true
  validates :loc_name, presence: true

  #Queries

  #Search for a locations near to lat and long params, in a radious
  #of more or less, rad kilometers
  #params lat, long and rad may be floats
  def self.getLocationsNearTo(lat, long, rad)
    #Only works on Postgresql
    Location.where('|/( (loc_lat - ?)^2 + (loc_long - ?)^2 ) < ?', lat, long, rad)
  end

end
