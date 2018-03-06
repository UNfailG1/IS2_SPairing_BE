class PlayerWhiteList < ApplicationRecord
  has_one :pla_whie_list_p1, class_name => "PlayerProfile"
  has_one :pla_whie_list_p2, class_name => "PlayerProfile"
end
