class ClimbsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @climbs = Climb.all
    @hash = Gmaps4rails.build_markers(@users) do |climbs, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

  def new
  end

  def create
  end

  def show
  end

end
