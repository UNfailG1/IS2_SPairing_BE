class PlayerBlackList < ApplicationRecord
  has_one :blocker, class_name => "PlayerProfile"
  has_one :blocked, class_name => "PlayerProfile"
end
