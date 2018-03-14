class Sponsor < ApplicationRecord
  has_many :ads

  validates :spo_name, presence: true
end
