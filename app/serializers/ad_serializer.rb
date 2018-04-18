# == Schema Information
#
# Table name: ads
#
#  id             :integer          not null, primary key
#  ad_description :text
#  ad_link        :string
#  ad_image       :string
#  sponsor_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_ads_on_sponsor_id  (sponsor_id)
#

class AdSerializer < ActiveModel::Serializer
  attributes :id, :ad_description, :ad_image, :ad_link

  belongs_to :sponsor
end
