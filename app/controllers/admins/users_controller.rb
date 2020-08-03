class Admins::UsersController < ApplicationController
    def index
        @users = User.with_deleted.all
    end

    def update
        @user = User.with_deleted.all.find(params[:id])
        if @user.deleted?
            @user.restore
        else
            @user.destroy
        end
        redirect_back(fallback_location: root_path)
    end
end
