class CheckinsController < ApplicationController
  def index
    @checkins = Checkin.all
    @climb = Climb.find_by_id(params[:climb_id])
    @user = User.find_by_id(session[:user_id])
  end

  def new
    @checkin = Checkin.new
  end

  def create
    @checkin = Checkin.new(checkin_params)
    if @checkin.save
      flash[:notice] = "You successfully checked in at #{@checkin.created_at.strftime("%b %-d, %-l:%M %p")}!"
      redirect_to climb_path(@checkin.climb_id)
    else
      flash[:error] = "Uh oh! There was an error in checking in!"
      redirect_to climb_path(@checkin.climb_id)
    end
  end

  private
    def checkin_params
      params.require(:checkin).permit(:climb_id, :user_id, :count)
    end
end
