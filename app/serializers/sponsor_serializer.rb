# == Schema Information
#
# Table name: sponsors
#
#  id         :integer          not null, primary key
#  spo_name   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SponsorSerializer < ActiveModel::Serializer
  attributes :id, :spo_name

  has_many :ads
end
