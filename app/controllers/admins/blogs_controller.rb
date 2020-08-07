class Admins::BlogsController < ApplicationController
    before_action :authenticate_admin!

    def tag_index
        @tags = ActsAsTaggableOn::Tag.all.page(params[:page]).per(10)
    end

    def tag_destroy
        @tags = ActsAsTaggableOn::Tag.all
        @tags.tag_list.remove(params[:id])
        @tags.save
        redirect_to admins_tags_path
    end

end
