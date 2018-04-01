class ThreadForum < ApplicationRecord
  belongs_to :sub_forum
  has_many :comments

  validates :thr_name, presence: true
  validates :thr_views, presence: true
  validates :thr_comments, presence: true

  #Queries

  #get comments of a player_profile on one ThreadForum
  def self.getCommentsOnThread
    self.joins(:comments).select('thread_forums.thr_name, comments.com_comment')
  end

  def self.getCommentByTerm(words)
    list = []
    words.each {|word| list << 'thr_name like "%' + word + '%"'}
    whereStatment = list.join(' OR ')
    self.where(whereStatment)
  end

end
