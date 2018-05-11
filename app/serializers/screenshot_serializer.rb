# == Schema Information
#
# Table name: screenshots
#
#  id         :integer          not null, primary key
#  scr_url    :string
#  scr_height :integer
#  scr_width  :integer
#  game_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_screenshots_on_game_id  (game_id)
#

class ScreenshotSerializer < ActiveModel::Serializer
  attributes :id, :scr_url, :scr_height, :scr_width
  has_one :game
end
