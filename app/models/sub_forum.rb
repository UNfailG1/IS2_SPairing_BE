class SubForum < ApplicationRecord
  belongs_to :game
  has_many :thread_forums

  validates :sf_name, presence: true
  validates :sf_description, presence: true

  #Queries

  #Search for SubForums with a name like name param
  #param name may be a string
  def self.getByNameLike(name)
    SubForum.where('sf_name like "%'+ name + '%"')
  end

  #Search for SubForums with a name equals to name param
  #param name may be a string
  def self.getByName(name)
    SubForum.where(sf_name: name)
  end

  #Search for a SubForum with a name equals to name param
  #If many, the first is returned
  #param name may be a string
  def self.getFirstByName(name)
    SubForum.getByName(name)[0]
  end

end
