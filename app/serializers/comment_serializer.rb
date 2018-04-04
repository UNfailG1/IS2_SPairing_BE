class CommentSerializer < ActiveModel::Serializer
  attributes :com_comment

  belongs_to :thread_forum
  belongs_to :player_profile
end
