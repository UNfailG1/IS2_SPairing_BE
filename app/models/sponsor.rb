# == Schema Information
#
# Table name: sponsors
#
#  id         :integer          not null, primary key
#  spo_name   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sponsor < ApplicationRecord
  has_many :ads, dependent: :destroy

  validates :spo_name, presence: true
end
