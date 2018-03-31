class Sponsor < ApplicationRecord
  has_many :ads, dependent: :destroy

  validates :spo_name, presence: true
end
