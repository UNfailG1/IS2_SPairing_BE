class Ad < ApplicationRecord
  belongs_to :sponsor

  validates :ad_description, presence: true
  validates :ad_link, presence: true
  validates :ad_image, presence: true
  validates :sponsor, presence: true

end
