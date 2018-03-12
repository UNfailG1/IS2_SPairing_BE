class SubForum < ApplicationRecord
  belongs_to :Game
  has_many :Thread

  validates :sub_for_name, presence: true
  validates :sub_for_description, presence: true
end
