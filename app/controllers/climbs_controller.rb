class ClimbsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_climb, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:edit, :update, :destroy]

  def index
    @climbs = Climb.all
    @hash = Gmaps4rails.build_markers(@climbs) do |climb, marker|
      marker.lat climb.latitude
      marker.lng climb.longitude
      marker.json({ :id => climb.id })
      link = view_context.link_to "More info about #{climb.name}", "/climbs/#{climb.id}"
      description = "#{link}"
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
    if @climb.update(climb_params)
      flash[:notice] = "Your climb was successfully updated!"
      redirect_to climb_path(@climb)
    else
      flash[:error] = "Uh oh! There was an error updating your climb, #{@climb.errors.full_messages.join(',')}"
      redirect_to climb_path(@climb)
    end
  end

  def destroy
    @climb.comments.delete_all
    if @climb.destroy
      flash[:notice] = "Your climb has been successfully deleted."
      redirect_to root_path
    else
      flash[:error] = "Uh oh! There was an error deleting your climb, #{@climb.errors.full_messages.join(',')}"
      redirect_to root_path
    end
  end

  private

    def set_climb
      @climb = Climb.find(params[:id])
    end

    def climb_params
      params.require(:climb).permit(:name, :image, :longitude, :latitude, :geolocation, :rating, :gear, :style, :gym?)
    end

    def require_admin
      redirect_to climb_path(@climb) unless User.find(session[:user_id]).admin?
    end
end
