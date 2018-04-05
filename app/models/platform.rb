# == Schema Information
#
# Table name: platforms
#
#  id         :integer          not null, primary key
#  plat_name  :string
#  plat_link  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Platform < ApplicationRecord
  has_and_belongs_to_many :games

  validates :plat_name, presence: true
  validates :plat_link, presence: true
end
