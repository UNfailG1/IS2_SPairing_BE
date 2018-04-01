class Platform < ApplicationRecord
  has_and_belongs_to_many :platforms

  validates :plat_name, presence: true
  validates :plat_link, presence: true

  #Queries

  #Search for Games available on a Platform
  def self.getGamesOnThisPlatform(platform_id)
    self.where(platform_id: platform_id).pluck(:gam_name)
  end

end
