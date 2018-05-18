# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  tag_name   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagSerializer < ActiveModel::Serializer
  attributes :id, :tag_name
end
