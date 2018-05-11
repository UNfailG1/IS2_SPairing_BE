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

class Screenshot < ApplicationRecord
  belongs_to :game
end
