# == Schema Information
#
# Table name: player_reports
#
#  id          :integer          not null, primary key
#  sender_id   :integer
#  receiver_id :integer
#  pr_reasons  :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PlayerReport < ApplicationRecord

  belongs_to :sender , class_name: "PlayerProfile"
  belongs_to :receiver, class_name: "PlayerProfile"

  validates :pr_reasons, presence: true
end
