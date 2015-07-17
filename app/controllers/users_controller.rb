class UsersController < ApplicationController
  before_action :set_user

  def index
    @users = User.all

  end

  def new
    @user = User.new

  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:success] = "Sign up successful."
      redirect_to user_show_path(current_user)
    else
      flash[:danger] = "Account already exists. Please try again."
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      else
          flash[:warning] = "Sorry, you can only view your own profile."
          redirect_to user_show_path(current_user)
      end
   
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
