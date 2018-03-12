class ThreadForum < ApplicationRecord
  belongs_to :SubForum
  belongs_to :Game
  has_many :Comment

  validates :thr_name, presence: true
  validates :thr_views, presence: true
  validates :thr_number_comments, presence: true
end
