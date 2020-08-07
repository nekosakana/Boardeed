class Game < ApplicationRecord
    has_many :blogs, dependent: :destroy

    validates :play_people, presence: true
    validates :play_time, presence: true
    validates :name, presence: true
end
