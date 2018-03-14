class Rating < ApplicationRecord
  has_one :rat_rater, :class_name => "PlayerProfile", foreign_key: "id"
  has_one :rat_recever, :class_name => "PlayerProfile", foreign_key: "id"

  validates :rat_rate, presence: true

end
