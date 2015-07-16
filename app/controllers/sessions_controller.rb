class SessionsController < ApplicationController

	 def new
    	@user = User.new

      # redirect_to user_path(current_user)
  
  end

   def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  def destroy
    logout
   
  end

  private
  def login_params
    user= params.require(:user)
    [user[:email], user[:password]]
  end
  
	
end
