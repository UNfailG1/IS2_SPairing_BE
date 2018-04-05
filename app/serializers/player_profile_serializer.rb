class PlayerProfileSerializer < ActiveModel::Serializer
  attributes :pp_username, :password_digest, :email, :pp_spairing_elo

  belongs_to :location

  has_many :player_game_profiles
  has_many :games
  has_many :comments
  has_many :mailboxes
  has_many :senders
  has_many :friends
  has_many :blocked_players
  
end
