# == Schema Information
#
# Table name: player_profiles
#
#  id              :integer          not null, primary key
#  pp_username     :string
#  password_digest :string
#  email           :string
#  pp_spairing_elo :float
#  pp_avatar       :string
#  pp_googleId     :string
#  location_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_player_profiles_on_location_id  (location_id)
#

require 'carrierwave/orm/activerecord'
# require 'rmagick'

class PlayerProfile < ApplicationRecord

  mount_uploader :pp_avatar, PlayerProfileUploader

  has_secure_password
  belongs_to :location, optional: true

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

  has_many :rates

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
  validates :email, uniqueness: {
    case_sensitive: false,
  }
  validates :pp_username, uniqueness: {
    case_sensitive: false,
  }
  validates :password, presence: true, if: :password
  validates :password, length: {minimum: 8}, if: :password
  validates :password, length: {maximum: 20}, if: :password
  validates :email, presence: true
  validates_with EmailValidator
  validates :pp_spairing_elo, presence: true

  #social networks signin
  def self.create_user_for_google(data)
    #sub toca verificarlo googleId
    where(email: data["email"]).first_or_initialize.tap do |user|
      user.pp_username=data["name"]
      user.email=data["email"]
      #user.pp_googleId=data["sub"]
      user.pp_spairing_elo=0.0
      user.location_id=1
      user.password=Time.now.to_i.to_s
      user.save!
    end
  end

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

  #Get count of users registered on a given day
  #Param day is a date that represents the of the querie
  def self.getUserCountDay(day)
    getUsersBetweenDates(day, day).count
  end

  #Get users registered on a intervale of time
  #Param start_date is a date that represents the first date to begin the querie
  #Param end_date is a date that represents is the last date to end the querie
  def self.getUsersBetweenDates(start_date, end_date)
    where(:created_at => start_date.beginning_of_day..end_date.end_of_day)
  end

  #Get statistic users registered on a intervale of time, per days
  #Param start_date is a date that represents the first date to begin the querie
  #Param end_date is a date that represents is the last date to end the querie
  def self.getUsersBetweenDatesPerDay(start_date, end_date)
    getUsersBetweenDatesPerUnit(start_date, end_date, 1.day)
  end

  #Get statistic users registered on a intervale of time, per months
  #Param start_date is a date that represents the first date to begin the querie
  #Param end_date is a date that represents is the last date to end the querie
  def self.getUsersBetweenDatesPerMonth(start_date, end_date)
    getUsersBetweenDatesPerUnit(start_date, end_date, 1.months)
  end

  #Get best 10 players on the website
  def self.getBestPlayers
    order(pp_spairing_elo: :desc).limit(10)
  end

  #Get the SPaiting recomendation for a player
  def getRecomendation()
    list = []
    PlayerProfile.all.each{ |actual_player|
      list << [actual_player, getSpairingMatchRateStaticalWeigh(actual_player)]
    }
    list.sort_by{ |key|
      -1*key[1]
    }

    list[0..9]
  end

  private

  #Get statistic users registered on a intervale of time, per unit of time
  #Param start_date is a date that represents the first date to begin the querie
  #Param end_date is a date that represents is the last date to end the querie
  #param unit is the amount of time to be counted
  def self.getUsersBetweenDatesPerUnit(start_date, end_date, unit)
    answer = {}
    while start_date <= end_date
      answer[start_date] = getUsersBetweenDates(start_date, start_date + unit).count
      start_date = start_date + unit
    end
    answer
  end

  def self.getSimilarProfiles(profile)

    # Get de profiles by username
    players = self.all

    # Filter location
    if profile.location != nil
      players = players.where(location_id: profile.location.id)
    end

    if profile.player_game_profiles.length > 0
      games = profile.player_game_profiles.pluck(:game_id)

      list = []
      games.each { |game| list << "game_id = #{game}" }
      players = players.joins(:player_game_profiles)
      .where(list.join(' OR '))
      .group(:player_profile_id)
      .select('count(player_profiles.id) as common_games, player_profiles.id, player_profiles.pp_avatar, player_profiles.pp_username')
      .order('count(player_profiles.id) DESC')
    end
    players
  end

    def getSpairingMatchRateStaticalWeigh(player)
      weighFunctions = [10, 10, 10, 100]
      getSpairingMatchRate(player, weighFunctions)
    end

    def getSpairingMatchRate(player, weighFunctions)
      weightedSPMatch = 0
      weightedSPMatch += weighFunctions[0]*getSpairingGameAffinity(player)
      weightedSPMatch += weighFunctions[1]*getSpairingAvatarColorAffinity(player)
      weightedSPMatch += weighFunctions[2]*getSpairingWordCommentAffinity(player)
      weightedSPMatch += weighFunctions[3]*getSpairingTagAffinity(player)

      weightedSPMatch / weighFunctions.sum
    end

    def getSpairingGameAffinity(player)
      count = 0
      setGame = Set.new
      player_game_profiles.each { |pgp| setGame << pgp.game_id }
      games_count = setGame.count
      player.player_game_profiles.each { |pgp|
        if setGame.include?(pgp.game_id) then
          count = count + 1
        else
          games_count = games_count + 1
        end
      }
      return Math.sqrt(Math.sqrt(Math.sqrt((count + 0.0)/games_count)))
    end

    # def getSpairingAvatarColorAffinity(player)
    #   if pp_avatar.file == nil or player.pp_avatar.file == nil
    #     return 0.5
    #   end
    #   img1 = Magick::Image.read(pp_avatar.file.file)[0]
    #   img2 = Magick::Image.read(player.pp_avatar.file.file)[0]
    #
    #   total = 0
    #   avg1   = { :r => 0.0, :g => 0.0, :b => 0.0 }
    #   img1.quantize.color_histogram.each { |c, n|
    #       avg1[:r] += n * c.red
    #       avg1[:g] += n * c.green
    #       avg1[:b] += n * c.blue
    #       total   += n
    #   }
    #   [:r, :g, :b].each { |comp| avg1[comp] /= total }
    #   [:r, :g, :b].each { |comp| avg1[comp] = (avg1[comp] / Magick::QuantumRange * 255).to_i }
    #
    #   avg2   = { :r => 0.0, :g => 0.0, :b => 0.0 }
    #   img2.quantize.color_histogram.each { |c, n|
    #       avg2[:r] += n * c.red
    #       avg2[:g] += n * c.green
    #       avg2[:b] += n * c.blue
    #       total   += n
    #   }
    #   [:r, :g, :b].each { |comp| avg2[comp] /= total }
    #   [:r, :g, :b].each { |comp| avg2[comp] = (avg2[comp] / Magick::QuantumRange * 255).to_i }
    #
    #   1 - (((avg1[:r] - avg2[:r])/256.0).abs + ((avg1[:g] - avg2[:g])/256.0).abs + ((avg1[:b] - avg2[:b])/256.0).abs)/3.0
    # end

    def getSpairingWordCommentAffinity(player)
      words = Set.new
      comments.each{ |comment|
        comment.com_comment.split(' ').each{ |word|
          words << word
        }
      }
      words_count = words.count
      affinity = 0
      player.comments.each{ |comment|
        comment.com_comment.split(' ').each{ |word|
          if words.include?(word) then
            affinity = affinity + 1
          else
            words_count = words_count + 1
          end
        }
      }
      Math.sqrt(Math.sqrt(Math.sqrt((affinity + 0.0)/words_count)))
    end

    def getSpairingTagAffinity(player)
      tag_set = Set.new
      player_game_profiles.each{ |pgp|
        pgp.tags.each{ |tag|
          tag_set << tag.id
        }
      }
      tag_count = tag_set.count
      affinity = 0
      player.player_game_profiles.each{ |pgp|
        pgp.tags.each{ |tag|
          if (tag_set).include?tag.id then
            affinity = affinity + 1
          else
            tag_count = tag_count + 1
          end
        }
      }
      Math.sqrt((affinity + 0.0)/tag_count)
    end

end
