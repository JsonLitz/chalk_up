class UsersController < ApplicationController
 skip_before_action :authenticate_user!, only: [:new, :create]
 before_action :res, only: [:create]
 before_action :set_user, only: [:show, :edit, :update, :destroy]


 def new
   @user = User.new
   p res
 end

 def create
   @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        login(@user)
        format.html { redirect_to user_path(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
 end

 def show
   @climbs = User.find(params[:id]).climbs.distinct

 end

 def edit
 end

 def update
   if @user.update_attributes(user_params)
     redirect_to user_path(current_user.id)
   else
     render "new"
   end
 end

 def destroy
   @user.delete
 end

 private

 def res
  request.path.split('/')[1][0..-2]
 end

 def set_user
   @user = User.find_by_id(params[:id])
 end

 def user_params
   params.require(:user).permit(:email, :password, :username, :image)
 end
end
