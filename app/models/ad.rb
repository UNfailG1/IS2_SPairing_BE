class Ad < ApplicationRecord
  belongs_to :Sponsor

  validates :ad_description, presence: true
  validates :ad_link, presence: true
  validates :ad_image_path, presence: true
  validates :sponsor, presence: true
end
