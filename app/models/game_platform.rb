class GamePlatform < ApplicationRecord
  belongs_to :platforms
  belongs_to :games
end
