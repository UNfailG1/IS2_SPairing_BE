class Rating < ApplicationRecord
  has_one :rat_rater, class_name => "PlayerProfile"
  has_one :rat_recever, class_name => "PlayerProfile"
end
