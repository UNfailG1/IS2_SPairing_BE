class Genre < ApplicationRecord
    has_and_belongs_to_many :games

    validate :gen_name, presence: true
end
