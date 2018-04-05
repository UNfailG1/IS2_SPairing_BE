# == Schema Information
#
# Table name: pegis
#
#  id         :integer          not null, primary key
#  peg_name   :string
#  peg_age    :integer
#  peg_image  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pegi < ApplicationRecord
  has_many :games, dependent: :nullify

  validates :peg_name, presence: true
  validates :peg_age, presence: true
  validates :peg_image, presence: true

  #Search for Pegis with age below age param
  #param age may be an integer
  def self.getByAgeBelow(age)
    Pegi.where("peg_age < ?", age)
  end

  #Search for Pegis with age above age param
  #param age may be an integer
  def self.getByAgeAbove(age)
    Pegi.where("peg_age > ?", age)
  end

  #Search for Pegis with age equal to age param
  #param age may be an integer
  def self.getByAge(age)
    Pegi.where("peg_age = ?", age)
  end

  #Search for a Pegi with age equal to age param
  #If found more than one, returns the first
  #param age may be an integer
  def self.getFirstByAge(age)
    Pegi.where("peg_age = ?", age)[0]
  end

  #Search for Pegis with age between age_low param and
  #age_upp param
  #param age may be an integer
  def self.getByAgeBetween(age_low, age_upp)
    Pegi.where("peg_age BETWEEN ? AND ?", age_low, age_upp)
  end

end
