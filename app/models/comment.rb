class Comment < ApplicationRecord
  belongs_to :Thread
  belongs_to :SubForum
  belongs_to :Game
  has_many :Attachment
end
