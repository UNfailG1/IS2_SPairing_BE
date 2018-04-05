class PegiSerializer < ActiveModel::Serializer
  attributes :peg_name, :peg_age, :peg_image

  has_many :games
end
