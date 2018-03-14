class PlayerWhiteList < ApplicationRecord
  has_one :player_friend_sender, :class_name => "PlayerProfile", foreign_key: "id"
  has_one :player_friend_recever, :class_name => "PlayerProfile", foreign_key: "id"
end
