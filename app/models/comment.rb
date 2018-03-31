class Comment < ApplicationRecord
  belongs_to :thread_forum
  belongs_to :player_profile

  validates :com_comment, presence: true
  validates :com_comment, length: {minimum: 1}

end
