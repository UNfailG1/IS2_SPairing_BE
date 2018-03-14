class Genre < ApplicationRecord
    has_and_belongs_to_many :games

    validates :gen_name, presence: true
end
