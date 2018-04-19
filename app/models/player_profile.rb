# == Schema Information
#
# Table name: player_profiles
#
#  id              :integer          not null, primary key
#  pp_username     :string
#  password_digest :string
#  email           :string
#  pp_spairing_elo :float
#  location_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_player_profiles_on_location_id  (location_id)
#

class PlayerProfile < ApplicationRecord

  has_secure_password
  belongs_to :location

  has_many :player_game_profiles, dependent: :destroy
  has_many :games, through: :player_game_profiles
  has_many :comments, dependent: :destroy

  has_and_belongs_to_many :friends,
                          class_name: 'PlayerProfile',
                          join_table: 'friends',
                          association_foreign_key: 'friend_player_profile_id'

  has_and_belongs_to_many :blocked_players,
                          class_name: 'PlayerProfile',
                          join_table: 'blocked_players',
                          association_foreign_key: 'blocked_player_profile_id'

  has_many :mailboxes, dependent: :nullify, foreign_key: 'receiver_id'
  has_many :senders, through: :mailboxes

  class EmailValidator < ActiveModel::Validator
    def validate(record)
      unless record.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors[:email] << 'Not an email'
      end
    end
  end

  validates :pp_username, presence: true
  validates :password, presence: true, if: :password
  validates :password, length: {minimum: 8}, if: :password
  validates :password, length: {maximum: 20}, if: :password
  validates :email, presence: true
  validates_with EmailValidator
  validates :pp_spairing_elo, presence: true

  #Queries

  #Search for Player Profiles with an username equals to username
  #param username may be a string
  def self.getByUsername(username)
    PlayerProfile.where(pp_username: username)
  end

  #Search for Player Profiles with an username equals to username param
  #If more than one is found (it may not happend), returns the first one
  #param username may be a string
  def self.getFirstByUsername(username)
    PlayerProfile.getByUsername(username)[0]
  end

  #Search for Player Profiles with usernames like username param
  #param username may be a string
  def self.getByUsernameLike(username)
    PlayerProfile.where("pp_username like ?", '%' + username + '%')
  end

  #Search for Player Profiles with an email equals to email
  #param email may be a string
  def self.getByEmail(email)
    PlayerProfile.where(email: email)
  end

  #Search for Player Profiles with an email equals to email
  #If more than one is found (it may not happend), returns the first one
  #param email may be a string
  def self.getFirstByEmail(email)
    PlayerProfile.getByEmail(email)[0]
  end

  #Search for Player Profiles with email like email param
  #param email may be a string
  #param email may not have domain (things after '@')
  def self.getByEmailLike(email)
    PlayerProfile.where("email like ?", '%' + email + '%@%')
  end

  #Search for Player Profiles with spairing_elo below spairing_elo params
  #param spairing_elo may be an integer
  def self.getBySParingEloBelow(spairing_elo)
    PlayerProfile.where("pp_spairing_elo < ?", spairing_elo)
  end

  #Search for Player Profiles with spairing_elo above spairing_elo params
  #param spairing_elo may be an integer
  def self.getBySParingEloAbove(spairing_elo)
    PlayerProfile.where("pp_spairing_elo > ?", spairing_elo)
  end

  #Search for Player Profiles with spairing_elo equals to spairing_elo params
  #param spairing_elo may be an integer
  def self.getBySParingEloEqual(spairing_elo)
    PlayerProfile.where(pp_spairing_elo: spairing_elo)
  end

  #Search for Player Profiles with spairing_elo between spairing_elo_low
  #and spairing_elo_upp params
  #param spairing_elo may be an integer
  def self.getBySParingEloBetween(spairing_elo_low, spairing_elo_upp)
    PlayerProfile.where("pp_spairing_elo BETWEEN ? AND ?", spairing_elo_low, spairing_elo_upp)
  end

  #Search for Profile Players who have Player Game Profile with games with name
  #like game_name param
  #param game_name may be a string
  def self.getByLikesGame(game_name)
    PlayerProfile.joins(:games).where("gam_name like '%" +  game_name  + "%'")
  end

  #Search for Profile Players who likes to use words like on words array params on
  #his/her comments
  #param words may be an array of strings
  def self.getByWordsOnComments(words)
    list = []
    words.each {|word| list << 'com_comment like "%' + word + '%"'}
    whereStatment = list.join(' OR ')
    PlayerProfile.joins(:comments).where(whereStatment)
  end


end
