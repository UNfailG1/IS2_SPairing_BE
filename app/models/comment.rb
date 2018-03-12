class Comment < ApplicationRecord
  belongs_to :Thread
  belongs_to :SubForum
  belongs_to :Game
  has_many :Attachment

  validates :com_com, presence: true
  validates :com_com, length: {minimum: 1}

end
