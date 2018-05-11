# == Schema Information
#
# Table name: games
#
#  id               :integer          not null, primary key
#  gam_name         :string
#  gam_description  :text
#  gam_link         :string
#  gam_image        :string
#  gam_user_counter :integer
#  gam_views        :integer
#  pegi_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_games_on_pegi_id  (pegi_id)
#



class GameSerializer < ActiveModel::Serializer
  attributes :id, :gam_name, :gam_description, :gam_link, :gam_image, :gam_user_counter, :gam_views

  belongs_to :pegi
  has_many :sub_forums
  has_many :player_game_profiles
  has_many :player_profiles
  has_many :genres
  has_many :platforms
  has_many :screenshots
end
