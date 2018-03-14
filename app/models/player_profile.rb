class EmailValidator < ActiveModel::Validator
  def validate(record)
    unless record.pla_pro_email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[:pla_pro_email] << ("Not an email")
    end
  end
end


class PlayerProfile < ApplicationRecord
  include ActiveModel::Validations

  has_one :Location
  has_many :player_game_profiles
  has_many :mail_sent, :class_name => 'Mailbox', :foreign_key => 'mail_sender_id'
  has_many :mail_recived, :class_name => 'Mailbox', :foreign_key => 'mail_recever_id'
  has_many :rate_rated, :class_name => 'Rating', :foreign_key => 'rat_rater_id'
  has_many :rate_receved, :class_name => 'Rating', :foreign_key => 'rat_recever_id'
  has_many :friends_sent, :class_name => 'PlayerWhiteList', :foreign_key => 'player_friend_sender_id'
  has_many :friends_recived, :class_name => 'PlayerWhiteList', :foreign_key => 'player_friend_sender_id'
  has_many :bad_friends_blocker, :class_name => 'PlayerBlackList', :foreign_key => 'blocker_id'
  has_many :bad_friends_blocked, :class_name => 'PlayerBlackList', :foreign_key => 'blocked_id'

  validates :pla_pro_real_name, presence: true
  validates :pla_pro_user_name, presence: true
  validates :pla_pro_password, presence: true
  validates :pla_pro_password, length: {minimum: 8}
  validates :pla_pro_password, length: {maximum: 20}
  validates :pla_pro_email, presence: true
  validates_with EmailValidator
  validates :pla_sparing_elo, presence: true

end
