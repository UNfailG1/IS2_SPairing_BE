# == Schema Information
#
# Table name: platforms
#
#  id         :integer          not null, primary key
#  plat_name  :string
#  plat_link  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  plat_views :integer
#

class Platform < ApplicationRecord
  has_and_belongs_to_many :games

  validates :plat_name, presence: true
  validates :plat_link, presence: true
  validates :plat_views, presence: true

  #Queries

  #Search for Games available on a Platform
  def self.getGamesOnThisPlatform(platform_id)
    self.where(platform_id: platform_id).pluck(:gam_name)
  end

  #Search for platforms with a name like name param
  #param name may be a string
  def self.getByNameLike(name)
    where('plat_name like "%'+ name + '%"')
  end

  #Search for genres with a name equals to name param
  #param name may be a string
  def self.getByName(name)
    where(plat_name: name)
  end

  #Search for a genre with a name equals to name param
  #If many, the first is returned
  #param name may be a string
  def self.getFirstByName(name)
    getByName(name)[0]
  end

end
