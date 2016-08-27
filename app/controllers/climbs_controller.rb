class ClimbsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @climbs = Climb.all
    @hash = Gmaps4rails.build_markers(@climbs) do |climb, marker|
      marker.lat climb.latitude
      marker.lng climb.longitude
    end
  end

  def new
  end

  def create
  end

  def show
  end

end
