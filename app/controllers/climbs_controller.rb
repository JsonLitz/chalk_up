class ClimbsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index

  end

  def new
    @climb = Climb.new
  end

  def create
    @climb = Climb.create(climb_params)
  
  end

  def show
  end
private

  def climb_params
      params.require(:climb).permit(:name,:image,:longitude, :latitude, :geolocation,:rating, :gear, :style, :gym?)
  end

end
