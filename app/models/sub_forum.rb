# == Schema Information
#
# Table name: sub_forums
#
#  id             :integer          not null, primary key
#  sf_name        :string
#  sf_description :text
#  game_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_sub_forums_on_game_id  (game_id)
#

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

  #Search for SubForums with a id equals to gameId param
  #param name may be a integer
  def self.getByGameId(gameId)
    SubForum.where(game_id: gameId)
  end

  #Search for a SubForum with a name equals to name param
  #If many, the first is returned
  #param name may be a string
  def self.getFirstByName(name)
    SubForum.getByName(name)[0]
  end

  #Get a collection of threads of the SubForum sorted by number of comments
  def getMostCommentedThreads
    thread_forums.order(thr_comments: :desc)
  end
end
