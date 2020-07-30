class Blog < ApplicationRecord
    acts_as_taggable
    belongs_to :user
    belongs_to :game
    attachment :image
    has_many :blog_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
