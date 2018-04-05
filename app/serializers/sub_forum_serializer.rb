class SubForumSerializer < ActiveModel::Serializer
  attributes :sf_name, :sf_description

  belongs_to :game
  has_many :thread_forums
end
