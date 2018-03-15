class Comment < ApplicationRecord
  belongs_to :thread_forum
  belongs_to :player_profile
  has_many :attachments, as: :attachable

  validates :com_com, presence: true
  validates :com_com, length: {minimum: 1}

end
