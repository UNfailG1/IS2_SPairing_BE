class Game < ApplicationRecord
  belongs_to :Pegi
  has_and_belongs_to_many :Genre
  has_and_belongs_to_many :Platform
  has_many :SubForum
  has_many :PlayerGameProfile

  validates :gam_name, presence: true
  validates :gam_description, presence: true
  validates :gam_link, presence: true

end
