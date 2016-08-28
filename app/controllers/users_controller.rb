class UsersController < ApplicationController
 skip_before_action :authenticate_user!, only: [:new, :create]


 def new
   @user = User.new
 end

 def create
   @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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

 def determine_resource
   request.path.split('/')
 end

 def set_user
   @user = User.find_by_id(params[:id])
 end

 def user_params
   params.require(:user).permit(:email, :password, :username, :image)
 end
end
