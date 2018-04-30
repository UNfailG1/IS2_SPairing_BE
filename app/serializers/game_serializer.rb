# == Schema Information
#
# Table name: games
#
#  id               :integer          not null, primary key
#  gam_name         :string
#  gam_description  :text
#  gam_link         :string
#  pegi_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  gam_user_counter :integer
#  gam_views        :integer
#
# Indexes
#
#  index_games_on_pegi_id  (pegi_id)
#

class GameSerializer < ActiveModel::Serializer
  attributes :id, :gam_name, :gam_description, :gam_link, :gam_user_counter, :gam_views

  belongs_to :pegi
  has_many :sub_forums
  has_many :player_game_profiles
  has_many :player_profiles
end
