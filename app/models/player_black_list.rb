class PlayerBlackList < ApplicationRecord
  has_one :pla_bla_list_p1, class_name => "PlayerProfile"
  has_one :pla_bla_list_p2, class_name => "PlayerProfile"
end
