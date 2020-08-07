class Admins::GamesController < ApplicationController
    before_action :authenticate_admin!

    def index
        @games = Game.all.page(params[:page]).per(10)
    end

    def show
        @game = Game.find(params[:id])
        @blogs = @game.blogs.all.page(params[:page]).per(10)
    end

    def edit
        @game = Game.find(params[:id])
    end

    def update
        @game = Game.find(params[:id])
        @game.update(game_params)
        redirect_to admins_game_path(@game.id)
    end

    def destroy
        
    end

    private
  def game_params
    params.require(:game).permit(:name, :play_people, :play_time)
  end

end
