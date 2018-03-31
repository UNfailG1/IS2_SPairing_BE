# == Schema Information
#
# Table name: pegis
#
#  id         :integer          not null, primary key
#  peg_name   :string
#  peg_age    :integer
#  peg_image  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pegi < ApplicationRecord
  has_many :games, dependent: :nullify

  validates :peg_name, presence: true
  validates :peg_age, presence: true
  validates :peg_image, presence: true

end
