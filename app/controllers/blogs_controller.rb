class BlogsController < ApplicationController
    before_action :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

    def index
        @blogs = Blog.all.page(params[:page]).reverse_order
        @tags = ActsAsTaggableOn::Tag.most_used
    end

    def old_index
        @blogs = Blog.all.page(params[:page])
        @tags = ActsAsTaggableOn::Tag.most_used
    end

    def user_index
        @user = User.find(params[:id])
        @blogs = @user.blogs.all.page(params[:page]).reverse_order
        @tags = ActsAsTaggableOn::Tag.most_used
    end

    def search
        @blogs = Blog.search(params[:search]).page(params[:page]).reverse_order
        @tags = ActsAsTaggableOn::Tag.most_used
    end

    def check_search
        @blogs = Blog.check_search(params[:play_people], params[:play_time]).page(params[:page]).reverse_order
        @tags = ActsAsTaggableOn::Tag.most_used
    end

    def tag_search
        @tags = ActsAsTaggableOn::Tag.most_used
        @blogs = Blog.tagged_with(params[:tag_name]).page(params[:page]).reverse_order
    end

    def show
        @blog = Blog.find(params[:id])
        @blog_comment = BlogComment.new
        @tags = ActsAsTaggableOn::Tag.most_used
    end

    def new
        @blog = Blog.new
        @tags = ActsAsTaggableOn::Tag.most_used
    end

    def create
        game_id = nil
        if params[:number] == "0"
            game_id = params[:blog][:game_id]
        elsif params[:number] == "1"
            game = Game.new(
                name: params[:blog][:name],
                play_people: params[:blog][:play_people],
                play_time: params[:blog][:play_time]
            )
            game.save
            game_id = game.id
        end
        @blog = Blog.new(
            title: params[:blog][:title],
            body: params[:blog][:body],
            image: params[:blog][:image],
            tag_list: params[:blog][:tag_list],
            user_id: current_user.id,
            game_id: game_id,
            rate: params[:blog][:rate],
        )
       if @blog.save
            redirect_to blog_path(@blog.id)
       else
        @tags = ActsAsTaggableOn::Tag.most_used
        render 'new'
       end

    end

    def edit
        @blog = Blog.find(params[:id])
        @tags = ActsAsTaggableOn::Tag.most_used
    end

    def update
        @blog = Blog.find(params[:id])
        if @blog.update(blog_params)
           redirect_to blogs_path
        else
           @tags = ActsAsTaggableOn::Tag.most_used
           render 'edit'
        end
    end

    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        redirect_to blogs_path
    end

    private
  def blog_params
    params.require(:blog).permit(:title, :image, :body, :tag_list, :number, :name, :game_id, :play_people, :play_time,:rate)
  end
end
