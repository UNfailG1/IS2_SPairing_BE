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

class LocationSerializer < ActiveModel::Serializer
  attributes :id, :id, :loc_name
end
