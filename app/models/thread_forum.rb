class ThreadForum < ApplicationRecord
  belongs_to :SubForum
  belongs_to :Game
end
