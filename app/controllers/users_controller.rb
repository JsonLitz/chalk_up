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
        format.html {
        flash[:error] = "There was an error in saving: #{@user.errors.full_messages.join(', ')}"
        redirect_to new_user_path
      }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
 end

 def show
  @climb_name = []
  @time_checked_in = []
  @justins_landspeeder = []
  @user.checkins.each.with_index do |checkin|
    @justin_is_my_copilot = checkin.climb_id
    @justins_landspeeder << @justin_is_my_copilot
    time_in = checkin.created_at.strftime("%b %-d %Y, %H:%M%p")
    @time_checked_in << time_in
    climb_name = climb_name(@justin_is_my_copilot)
    @climb_name << climb_name
  end
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
  flash[:notice] = "Your account was successfuly deleted. We hope to see you again soon!"
  redirect_to root_path
 end

 private

 def climb_name(id)
   Climb.find_by_id(id).name
 end

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
