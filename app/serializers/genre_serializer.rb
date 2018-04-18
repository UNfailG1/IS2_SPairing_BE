# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  gen_name   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GenreSerializer < ActiveModel::Serializer
  attributes :id, :gen_name
end
