class PlayerProfile < ApplicationRecord
  has_one :Location
  has_many :PlayerGameProfile
  has_many :Mailbox
  has_many :Rating
  has_many :PlayerWhiteList
end
