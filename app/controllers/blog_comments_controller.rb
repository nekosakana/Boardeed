class BlogCommentsController < ApplicationController
    def create
        blog = Blog.find(params[:blog_id])
        @comment = BlogComment.new(blog_comment_params)
        @comment.user_id = current_user.id
        @comment.blog_id = blog.id
        if @comment.save
            redirect_to blog_path(blog)
        else
            @blog = blog
            @blog_comment = BlogComment.new
            @tags = ActsAsTaggableOn::Tag.most_used
            render 'blogs/show'
        end
    end

    def destroy
        BlogComment.find_by(id: params[:id], blog_id: params[:blog_id]).destroy
        redirect_to blog_path(params[:blog_id])
    end

    private
    def blog_comment_params
        params.require(:blog_comment).permit(:comment)
      end
end
