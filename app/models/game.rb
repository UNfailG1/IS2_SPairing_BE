# == Schema Information
#
# Table name: games
#
#  id              :integer          not null, primary key
#  gam_name        :string
#  gam_description :text
#  gam_link        :string
#  pegi_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_games_on_pegi_id  (pegi_id)
#

class Game < ApplicationRecord
  belongs_to :pegi
  has_many :sub_forums, dependent: :destroy
  has_many :player_game_profiles, dependent: :destroy
  has_many :player_profiles, through: :player_game_profiles

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :platforms

  validates :gam_name, presence: true
  validates :gam_description, presence: true
  validates :gam_link, presence: true
  validates :pegi_id, presence: true

end
