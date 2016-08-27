class ClimbsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @climbs = Climb.all

  end

  def new
    @climb = Climb.new(climb_params)
    @climb.save

  end

  def create
  end

  def show
  end

  def climb_params
      params.require(:climb).permit(:name,:image,:longitude, :latitude, :geolocation,:rating, :gear)     
  end

end
