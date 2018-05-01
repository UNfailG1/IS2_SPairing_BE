# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  gen_name   :string
#  gen_views  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#



class GenreSerializer < ActiveModel::Serializer
  attributes :id, :gen_name, :gen_views
end
