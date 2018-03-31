# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  loc_lat    :decimal(, )
#  loc_long   :decimal(, )
#  loc_name   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
  has_many :player_profiles, dependent: :nullify

  validates :loc_lat, presence: true
  validates :loc_long, presence: true
  validates :loc_name, presence: true
end
