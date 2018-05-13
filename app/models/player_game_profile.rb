# == Schema Information
#
# Table name: player_game_profiles
#
#  id                :integer          not null, primary key
#  pgp_reputation    :float
#  pgp_nickname      :string
#  pgp_rate          :float
#  game_id           :integer
#  player_profile_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_player_game_profiles_on_game_id            (game_id)
#  index_player_game_profiles_on_player_profile_id  (player_profile_id)
#

class PlayerGameProfile < ApplicationRecord
  belongs_to :game
  belongs_to :player_profile
  has_and_belongs_to_many :tags, join_table: 'tag_players'

  validates :pgp_reputation, presence: true
  validates :pgp_nickname, presence: true
  validates :pgp_rate, presence: true

  #Search for Player Game Profiles by their nickname equal to
  #nickname param
  #param nickname may be a string
  def self.getByNickname(nickname)
    PlayerGameProfile.where(pgp_nickname: nickname)
  end

  def self.getByPlayerId(id)
    PlayerGameProfile.where(player_profile_id: id)
  end

  #Search for Player Game Profiles by his/her nickname equal to
  #nickname param, if more than one is found, return the first
  #param nickname may be a string
  def self.getFirstByNickname(nickname)
    PlayerGameProfile.where(pgp_nickname: nickname)[0]
  end

  #Search for Player Game Profiles by their nickname likes
  #nickname param
  #param nickname may be a string
  def self.getByNicknameLike(nickname)
    PlayerGameProfile.where("pgp_nickname like ?", '%' + nickname + '%')
  end

  #Search for PlayerGameProfiles by his/her reputation below
  #reputation param
  #param reputation may be a float
  def self.getByReputationBelow(reputation)
    PlayerGameProfile.where("pgp_reputation < ?", reputation)
  end

  #Search for PlayerGameProfiles by his/her reputation above
  #reputation param
  #param reputation may be a float
  def self.getByReputationAbove(reputation)
    PlayerGameProfile.where("pgp_reputation > ?", reputation)
  end

  #Search for PlayerGameProfiles by his/her reputation equal
  #reputation param
  #param reputation may be a float
  def self.getByReputationEqual(reputation)
    PlayerGameProfile.where("pgp_reputation = ?", reputation)
  end

  #Search for PlayerGameProfiles by his/her reputation between
  #reputation_low param and reputation_upp param
  #param reputation_low may be a float
  #param reputation_upp may be a float
  def self.getByReputationEqual(reputation_low, reputation_upp)
    PlayerGameProfile.where("pgp_reputation BETWEEN ? AND ?", reputation_low, reputation_upp)
  end

  #Search for PlayerGameProfiles by his/her rate below
  #rate param
  #param rate may be a float
  def self.getByRateBelow(rate)
    PlayerGameProfile.where("pgp_rate < ?", rate)
  end

  #Search for PlayerGameProfiles by his/her rate above
  #rate param
  #param rate may be a float
  def self.getByRateAbove(rate)
    PlayerGameProfile.where("pgp_rate > ?", rate)
  end

  #Search for PlayerGameProfiles by his/her rate equal
  #rate param
  #param rate may be a float
  def self.getByRateEqual(rate)
    PlayerGameProfile.where("pgp_rate = ?", rate)
  end

  #Search for PlayerGameProfiles by his/her rate between
  #rate_low param and rate_upp param
  #param rate_low may be a float
  #param rate_upp may be a float
  def self.getByRateEqual(rate_low, rate_upp)
    PlayerGameProfile.where("pgp_rate BETWEEN ? AND ?", rate_low, rate_upp)
  end

  #Search a Player Game Profile by PlayerProfile id and Game id
  #param player_id
  #param game_id
  def self.getPlayerGameProfileByPlayerProfileIdAndGameId(player_id, game_id)
      PlayerGameProfile.where("game_id = ? AND player_profile_id = ?", game_id, player_id)[0]
  end

end
