# == Schema Information
#
# Table name: platforms
#
#  id         :integer          not null, primary key
#  plat_name  :string
#  plat_link  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Platform < ApplicationRecord
  has_and_belongs_to_many :games

  validates :plat_name, presence: true
  validates :plat_link, presence: true

  #Queries

  #Search for Games available on a Platform
  def self.getGamesOnThisPlatform(platform_id)
    self.where(platform_id: platform_id).pluck(:gam_name)
  end

  #Seed record of the game
  def seedRecord
    puts("Platform.create(id: " + id.to_s + ", plat_name: \""+ plat_name + "\", plat_link: \"" + plat_link + "\")")
  end

end
