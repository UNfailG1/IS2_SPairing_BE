class PlayerGameProfile < ApplicationRecord
  belongs_to :PlayerProfile
  belongs_to :Game
end
