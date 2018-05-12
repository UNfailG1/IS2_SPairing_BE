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

class PlayerReportSerializer < ActiveModel::Serializer
  attributes :id
end
