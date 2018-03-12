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
  has_many :PlayerGameProfile
  has_many :Mailbox
  has_many :Rating
  has_many :PlayerWhiteList

  validates :pla_pro_real_name, presence: true
  validates :pla_pro_user_name_string, presence: true
  validates :pla_pro_password, presence: true
  validates :pla_pro_password, length: {minimum: 8}
  validates :pla_pro_password, length: {maximum: 20}
  validates :pla_pro_email, presence: true
  validates_with EmailValidator
  validates :pla_sparing_elo, presence: true

end
