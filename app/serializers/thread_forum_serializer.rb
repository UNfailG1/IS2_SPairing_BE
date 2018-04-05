class ThreadForumSerializer < ActiveModel::Serializer
  attributes :thr_name, :thr_views, :thr_comments

  belongs_to :sub_forum
  has_many :comments
end
