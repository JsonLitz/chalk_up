class ClimbsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_climb, only: [:show, :edit, :update, :destroy]

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

  def edit
    @climb = Climb.find(params[:id])
  end

  def update
    @climb.update(climb_params)
    redirect_to root_path
  end

  def destroy
    @climb.destroy
    redirect_to root_path
  end

  private

  def set_climb
    @climb = Climb.find(params[:id])
  end

  def climb_params
    params.require(:climb).permit(:name,:image,:longitude, :latitude, :geolocation,:rating, :gear, :style, :gym?)
  end
end
