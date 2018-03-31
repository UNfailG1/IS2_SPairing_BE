class Ad < ApplicationRecord
  belongs_to :sponsor

  validates :ad_description, presence: true
  validates :ad_link, presence: true
  validates :ad_image, presence: true
  validates :sponsor, presence: true

  # Search for Ads with a given ad_link
  def self.getByLink(ad_link)
      Ad.where(ad_link: ad_link)
  end

  #Seach for an Ad with a given ad_link, if it is found more than
  #one, returns the first (this may not happend)
  def self.getFirstByLink(ad_link)
    Ad.getByLink(ad_link)[0]
  end

  # Search for Ads with a given ad_image
  def self.getByImage(ad_image)
      Ad.where(ad_image: ad_image)
  end

  #Seach for an Ad with a given ad_image, if it is found more than
  #one, returns the first (this may not happend)
  def self.getFirstByImage(ad_image)
    Ad.getByImage(ad_image)[0]
  end



end
