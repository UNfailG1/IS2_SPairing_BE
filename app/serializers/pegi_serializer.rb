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

class PegiSerializer < ActiveModel::Serializer
  attributes :id, :peg_name, :peg_age, :peg_image

  has_many :games
end
