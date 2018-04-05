class GameSerializer < ActiveModel::Serializer
  attributes :gam_name, :gam_description, :gam_link

  belongs_to :pegi
  has_many :sub_forums
  has_many :player_game_profiles
  has_many :player_profiles

end
