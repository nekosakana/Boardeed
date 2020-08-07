class Admins::UsersController < ApplicationController
    before_action :authenticate_admin!

    def index
        @users = User.with_deleted.all.page(params[:page]).per(10)
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
