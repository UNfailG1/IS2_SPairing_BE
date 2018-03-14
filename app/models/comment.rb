class Comment < ApplicationRecord
  belongs_to :thread
  belongs_to :sub_forum
  belongs_to :game
  has_many :attachments, as :attachable

  validates :com_com, presence: true
  validates :com_com, length: {minimum: 1}

end
