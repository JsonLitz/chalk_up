class UsersController < ApplicationController
 skip_before_action :authenticate_user!, only: [:new, :create]


 def new
   @user = User.new
 end

 def create
   @user = User.create(user_params)
   if @user.valid?
     login(@user)
     redirect_to @user
   else
     flash[:notice] = 'email already exists'
     redirect_to('/signup')
   end
 end

 def show
   set_user
 end

 def edit
   set_user
 end

 def update
   set_user
   if @user.update_attributes(user_params)
     redirect_to user_path(current_user.id)
   else
     render "new"
   end
 end

 def destroy
   set_user
   @user.delete
 end

 private
 def set_user
   @user = User.find_by_id(params[:id])
 end

 def user_params
   params.require(:user).permit(:email, :password_digest, :username)
 end
end
