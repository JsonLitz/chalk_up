class SessionsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.confirm(user_params)
    if @user
      flash[:success] = "Login successful! Welcome #{user.username}!"
      login(@user)
      redirect_to @user
    else
      flash[:error] = "Incorrect email or password. Please try again"
      redirect_to login_path
    end
  end

  def destroy
    flash[:success] = "Logout successful. See you soon!"
    logout
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end


end
