class Platform < ApplicationRecord
  has_and_belongs_to_many :games

  validates :plat_name, presence: true
  validates :plat_link, presence: true
end
