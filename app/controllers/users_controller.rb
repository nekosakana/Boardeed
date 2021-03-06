class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.all.page(params[:page]).reverse_order
  end

  def edit
    @user = current_user
    if @user != current_user
      redirect_to user_path
    end
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path
  end

  def confirm
    
  end

  def destroy
		current_user.destroy
		sign_out_and_redirect(current_user)
	end

  private 
def user_params
  params.require(:user).permit(:name, :profile_image, :email)
end
end
