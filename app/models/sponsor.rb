class Sponsor < ApplicationRecord
  has_many :Ad

  validates :spo_name, presence: true
end
