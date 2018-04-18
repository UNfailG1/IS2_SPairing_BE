# == Schema Information
#
# Table name: player_profiles
#
#  id              :integer          not null, primary key
#  pp_username     :string
#  password_digest :string
#  email           :string
#  pp_spairing_elo :float
#  location_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_player_profiles_on_location_id  (location_id)
#

class PlayerProfileOnlySerializer < ActiveModel::Serializer
  attributes :id, :pp_username, :email, :pp_spairing_elo, :location_id

  belongs_to :location

end
