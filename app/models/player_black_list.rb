class PlayerBlackList < ApplicationRecord
  has_one :blocker, :class_name => "PlayerProfile", foreign_key: "id"
  has_one :blocked, :class_name => "PlayerProfile", foreign_key: "id"
end
