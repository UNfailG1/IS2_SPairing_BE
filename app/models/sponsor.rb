class Sponsor < ApplicationRecord
  has_many :ads, dependent: :destroy

  validates :spo_name, presence: true
  
  # Search about a sponsor who owns Ad by some image
  # If two ads have the same image (this may not happend), returns the first
  # found
  def self.getByAdImage(ad_image)
      (Ad.where(ad_image: ad_image)[0]).sponsor
  end

  # Search about a sponsor who owns Ad by some link
  # If two ads have the same link (this may not happend), returns the first
  # found
  def self.getByAdLink(ad_link)
      (Ad.where(ad_link: ad_link)[0]).sponsor
  end

  # Search about sponsors who have as name, name

  def self.getByName(name)
    Sponsor.where(spo_name: name)
  end

  # Search about a sponsor who have as name, name
  # If two sponsors have the same name, returns the first found
  def self.getFirtsByName(name)
    Sponsor.getByName[0]
  end



end
