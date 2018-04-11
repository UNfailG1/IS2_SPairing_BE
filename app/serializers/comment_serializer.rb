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

class CommentSerializer < ActiveModel::Serializer
  attributes :com_comment

  belongs_to :thread_forum
  belongs_to :player_profile
end
