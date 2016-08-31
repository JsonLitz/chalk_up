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
        format.html { redirect_to user_path(@user), notice: 'You have successfully signed up!' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
 end

 def show
 end

 def edit
 end

 def update
   if @user.update_attributes(user_params)
     flash[:notice] = "Your profile has been successfully updated"
     redirect_to user_path(current_user.id)
   else
     flash[:error] = "There was an error in updating your profile"
     redirect_to @user
   end
 end

 def destroy

   @user.comments.delete_all
   @user.destroy
   logout

   flash[:notice] = "Your acount was successfuly deleted. We hope to see you again soon!"
   redirect_to root_path
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
