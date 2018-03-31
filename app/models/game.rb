class Game < ApplicationRecord
  belongs_to :pegi
  has_many :sub_forums, dependent: :destroy
  has_many :player_game_profiles, dependent: :destroy
  has_many :player_profiles, through: :player_game_profiles

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :platforms

  validates :gam_name, presence: true
  validates :gam_description, presence: true
  validates :gam_link, presence: true
  validates :pegi_id, presence: true

  #Search for games with a Pegi age below age param
  #param age may be an integer
  def self.getByPegiBelow(age)
    Game.where(pegi_id: Pegi.getByAgeBelow(age))
  end

  #Search for games with a Pegi age above age param
  #param age may be an integer
  def self.getByPegiAbove(age)
    Game.where(pegi_id: Pegi.getByAgeAbove(age))
  end

  #Search for games with a Pegi age between age_low param and age_upp param
  #param age may be an integer
  def self.getByPegiBetween(age_low, age_upp)
    Game.where(pegi_id: Pegi.getByAgeBetween(age_low, age_upp))
  end

  #Search for games with words of an array on its ad_description
  #param words may be a string array
  def self.getByWordsOnDescription(words)
    whereStatment = 'gam_description like "%' + words[0] + '%"'  # To correct: words[0] may apprears twice
    words.each{|word| whereStatment += ' OR gam_description like "%' + word + '%"'}
    Game.where(whereStatment)
  end

  #Search for games with names like name param
  #param name may be a string
  def self.getByNameLike(name)
    Game.where('gam_name like "%' + name + '%"')
  end

  #Search for games with the name equal to name param
  #param nam my be a string
  def self.getByName(name)
    Game.where(gam_name: name)
  end

  #Search for a game with the name equal to name param
  #If more than one game apprears, first is return
  #param name my be a string
  def self.getFirstByName(name)
    Game.getByName(name)[0]
  end
end
