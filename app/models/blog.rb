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

    def Blog.search(search)
        if search
           Blog.where(['title LIKE ?', "%#{search}%"])
           Blog.where(['body LIKE ?', "%#{search}%"])
           Blog.joins(:game).where(['name LIKE?', "%#{search}%"])
        else
           Blog.all
        end
    end

    def Blog.check_search(play_people, play_time)
        if play_people && play_time
            Blog.joins(:game).where(games: {play_people: play_people, play_time: play_time})
        elsif play_people
            Blog.joins(:game).where(games: {play_people: play_people})
        elsif play_time
            Blog.joins(:game).where(games: {play_time: play_time})
        else
            Blog.all
        end
        
    end
end
