# == Schema Information
#
# Table name: games
#
#  id               :integer          not null, primary key
#  gam_name         :string
#  gam_description  :text
#  gam_link         :string
#  pegi_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  gam_user_counter :integer
#  gam_views        :integer
#
# Indexes
#
#  index_games_on_pegi_id  (pegi_id)
#

class Game < ApplicationRecord
  belongs_to :pegi
  has_many :sub_forums, dependent: :destroy
  has_many :player_game_profiles, dependent: :destroy
  has_many :player_profiles, through: :player_game_profiles

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :platforms

  validates :gam_name, presence: true
  validates :gam_views, presence: true
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
    list = []
    words.each{|word| list << 'gam_description like "%' + word + '%"'}
    whereStatment = list.join(' OR ')
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

  #Get a collection of threads of the Game sorted by number of comments
  def getMostCommentedThreads
    list = []
    sub_forums.each{|subForum| list << 'sub_forum_id = ' + subForum.id.to_s}
    whereStatment = list.join(' OR ')
    ThreadForum.order(thr_comments: :desc).where(whereStatment)
  end

  #Get most played games
  def self.getMostPlayed
    self.order(gam_user_counter: :desc)
  end

end
