# == Schema Information
#
# Table name: thread_forums
#
#  id           :integer          not null, primary key
#  thr_name     :string
#  thr_views    :integer
#  thr_comments :integer
#  sub_forum_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_thread_forums_on_sub_forum_id  (sub_forum_id)
#

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
