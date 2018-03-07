class SubForum < ApplicationRecord
  belongs_to :Game
  has_many :Thread
end
