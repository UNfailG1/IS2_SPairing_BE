class Genre < ApplicationRecord
    has_and_belongs_to_many :Game

    validate :gen_name, presence: true
end
