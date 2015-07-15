class UsersController < ApplicationController
  # before_action :set_user

  def index
    @users = User.all

  end

  def new
    @user = User.new

  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user = User.create(user_params)
    login(@user) # <-- login the user
    redirect_to "/users/#{@user.id}" # <-- go to show
  end

  def show
    @user = User.find(params[:id])
   
  end

  private
  def set_user
    @user = current_user 
  end

  def user_params
    white_list = [
            :email, :email_confirmation, 
            :password, :password_confirmation, 
            :first_name, :last_name
            ]
    params.require(:user).permit(*white_list)
  end

end
