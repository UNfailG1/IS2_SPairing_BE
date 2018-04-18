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
#  pp_avatar       :string
#
# Indexes
#
#  index_player_profiles_on_location_id  (location_id)
#

class PlayerProfileSerializer < ActiveModel::Serializer
  attributes :id, :pp_username, :email, :pp_spairing_elo

  belongs_to :location

  has_many :player_game_profiles
  has_many :games
  has_many :comments
  has_many :mailboxes
  has_many :senders
  has_many :friends
  has_many :blocked_players

end
