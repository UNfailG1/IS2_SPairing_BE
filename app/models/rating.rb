class Rating < ApplicationRecord
  has_one :rat_rater, :class_name => "PlayerProfile", foreign_key: "rater_id"
  has_one :rat_recever, :class_name => "PlayerProfile", foreign_key: "recever_id"

  validates :rat_rate, presence: true

end
