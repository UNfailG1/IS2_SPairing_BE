class SponsorSerializer < ActiveModel::Serializer
  attributes :spo_name

  has_many :ads
end
