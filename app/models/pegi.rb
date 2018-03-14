class Pegi < ApplicationRecord
    has_many :games

    validates :peg_name, presence: true
    validates :peg_age, presence: true
    validates :peg_image, presence: true


end
