class ThreadForumSimpleSerializer < ActiveModel::Serializer
  attributes :id, :thr_name, :thr_views, :thr_comments
end
