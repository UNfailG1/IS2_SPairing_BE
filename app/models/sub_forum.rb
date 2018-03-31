class SubForum < ApplicationRecord
  belongs_to :game
  has_many :thread_forums

  validates :sf_name, presence: true
  validates :sf_description, presence: true
end
