# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  thread_forum_id   :integer
#  player_profile_id :integer
#  com_comment       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_comments_on_player_profile_id  (player_profile_id)
#  index_comments_on_thread_forum_id    (thread_forum_id)
#

class Comment < ApplicationRecord
  belongs_to :thread_forum
  belongs_to :player_profile

  validates :com_comment, presence: true
  validates :com_comment, length: {minimum: 1}

  #Queries
  # get comments of a player_profile and where they were done.
  def self.getCommentsOfPlayer(player_profile_id)
    self.joins(:thread_forum).select('thread_forums.thr_name, comments.com_comment')
    .where(player_profile_id: player_profile_id)
  end

  # get comments from a ThreadForum.
  def self.getCommentsOfPlayer(thread_forum_id)
    self.where(thread_forum_id: thread_forum_id)
  end

  def self.getCommentByTerm(words)
    list = []
    words.each {|word| list << 'com_comment like "%' + word + '%"'}
    whereStatment = list.join(' OR ')
    self.where(whereStatment)
  end
end
