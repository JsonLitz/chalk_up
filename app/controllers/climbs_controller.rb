class ClimbsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_climb, only: [:show, :edit, :update, :destroy]

  def index

    @climbs = Climb.all
    @hash = Gmaps4rails.build_markers(@climbs) do |climb, marker|  
      marker.lat climb.latitude
      marker.lng climb.longitude
      marker.json({ :id => climb.id })
      link = view_context.link_to "Would You Like to Know More About #{climb.name}?", "/climbs/#{climb.id}"  
      description = "#{link}"  
      marker.infowindow description
      determine_pin_color(climb, marker)
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

    def determine_pin_color(climb, marker)
      if climb.gym? == true
          color = '585123'   
      elsif climb.verification != nil
         color = '772F1A'
      else
         color = 'EEC170'
      end
        build_pin_image(color, climb, marker)
    end

    def build_pin_image(color, climb, marker)
      marker.picture({ 
          :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|#{color}|000000",
          :width => 32,
          :height => 32 
          });
    end
    
    def set_climb
        @climb = Climb.find(params[:id])
    end

    def climb_params
        params.require(:climb).permit(:name, :image, :longitude, :latitude, :geolocation, :rating, :gear, :style, :gym?)
    end
end
