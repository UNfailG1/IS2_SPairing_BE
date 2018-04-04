class PlayerGameProfileSerializer < ActiveModel::Serializer
  attributes :pgp_reputation, :pgp_nickname, :pgp_rate

  belongs_to :game
  belongs_to :player_profile
end
