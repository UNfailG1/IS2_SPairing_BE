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

  belongs_to :location

  has_many :player_game_profiles, dependent: :destroy
  has_many :games, through: :player_game_profiles

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
  #validates :password, presence: true
  #validates :password, length: {minimum: 8}
  #validates :password, length: {maximum: 20}
  validates :email, presence: true
  validates_with EmailValidator
  validates :pp_spairing_elo, presence: true

end
