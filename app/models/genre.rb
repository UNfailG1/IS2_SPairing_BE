class Genre < ApplicationRecord
  has_and_belongs_to_many :games, dependent: :nullify

  validates :gen_name, presence: true
end
