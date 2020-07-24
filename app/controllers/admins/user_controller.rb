class Admins::UserController < ApplicationController
    def index
        @users = User.all
    end
end
