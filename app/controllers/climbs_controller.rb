class ClimbsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_climb, only: [:show, :edit, :update, :destroy]

  def index
    @climbs = Climb.all
    @hash = Gmaps4rails.build_markers(@climbs) do |climb, marker|
      marker.lat climb.latitude
      marker.lng climb.longitude
    end
  end

  def new
    @climb = Climb.new
  end

  def create
    @climb = Climb.new(climb_params)
    @climb.save
    redirect_to climb_path(@climb)

  end

  def show
  end

  private

    def set_climb
      @climb = Climb.find(params[:id])
    end

    def climb_params
        params.require(:climb).permit(:name,:image,:longitude, :latitude, :geolocation,:rating, :gear, :style, :gym?)
    end

end
