# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  gen_name   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Genre < ApplicationRecord
  has_and_belongs_to_many :games, dependent: :nullify

  validates :gen_name, presence: true
end
