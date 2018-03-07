class ThreadForum < ApplicationRecord
  belongs_to :SubForum
  belongs_to :Game
  has_many :Comment
end
