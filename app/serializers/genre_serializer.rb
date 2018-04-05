class GenreSerializer < ActiveModel::Serializer
  attributes :gen_name

  has_and_belongs_to_many :games
end
