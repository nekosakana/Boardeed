class Game < ApplicationRecord
    has_many :blogs, dependent: :destroy
end
