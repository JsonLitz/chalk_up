class ClimbsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_climb, only: [:show, :edit, :update, :destroy]

  def index

    @climbs = Climb.all
    @hash = Gmaps4rails.build_markers(@climbs) do |climb, marker|
      marker.lat climb.latitude
      marker.lng climb.longitude
      marker.json({ :id => climb.id })
      link = view_context.link_to "more info about #{climb.name}", "/climbs/#{climb.id}"  
      description = "Website: #{link}"  
      marker.infowindow description

    end
    
  end

  def new
    @climb = Climb.new
  end

  def create
    @climb = Climb.new(climb_params)
    respond_to do |format|
      if @climb.save
        format.html { redirect_to climb_path(@climb), notice: 'Climb was successfully created.' }
        format.json { render :show, status: :created, location: @climb }
      else
        format.html { render :new }
        format.json { render json: @climb.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    @climb.update(climb_params)
    redirect_to climb_path(@climb)
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
        params.require(:climb).permit(:name, :image, :longitude, :latitude, :geolocation, :rating, :gear, :style, :gym?)
    end
end
