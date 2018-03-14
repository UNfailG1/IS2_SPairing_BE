class Ad < ApplicationRecord
  belongs_to :sponsor

  validates :ad_description, presence: true
  validates :ad_link, presence: true
  validates :ad_image_path, presence: true
end
