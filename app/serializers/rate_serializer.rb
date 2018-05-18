# == Schema Information
#
# Table name: rates
#
#  id                     :integer          not null, primary key
#  rate_rate              :float
#  player_game_profile_id :integer
#  player_profile_id      :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class RateSerializer < ActiveModel::Serializer
  attributes :id
end
