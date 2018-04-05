# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  gen_name   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Genre < ApplicationRecord
  has_and_belongs_to_many :games, dependent: :nullify

  validates :gen_name, presence: true

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

end
