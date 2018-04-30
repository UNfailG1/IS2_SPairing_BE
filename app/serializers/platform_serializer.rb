# == Schema Information
#
# Table name: platforms
#
#  id         :integer          not null, primary key
#  plat_name  :string
#  plat_link  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  plat_views :integer
#

class PlatformSerializer < ActiveModel::Serializer
  attributes :id, :plat_name, :plat_link, :plat_views
end
