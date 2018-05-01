# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  gen_name   :string
#  gen_views  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Genre < ApplicationRecord
  has_and_belongs_to_many :games, dependent: :nullify

  validates :gen_name, presence: true
  validates :gen_views, presence: true

  #Queries

  #Search for genres with a name like name param
  #param name may be a string
  def self.getByNameLike(name)
    Genre.where('gen_name like "%'+ name + '%"')
  end

  #Search for genres with a name equals to name param
  #param name may be a string
  def self.getByName(name)
    Genre.where(gen_name: name)
  end

  #Search for a genre with a name equals to name param
  #If many, the first is returned
  #param name may be a string
  def self.getFirstByName(name)
    Genre.getByName(name)[0]
  end

  #Show the 10 most viewed genres
  def self.getMostViewed()
    order(gen_views: :desc).limit(10)
  end

  #Seed record of the game
  def seedRecord
    puts("Genre.create(id: " + id.to_s + ", gen_name: \"" + gen_name + "\")")
  end

end
