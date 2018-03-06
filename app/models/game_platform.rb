class GamePlatform < ApplicationRecord
  belongs_to :Platform
  belongs_to :Game
end
