class ClimbsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
  end

  def new
    @climb = Climb.new
  end

  def create
  end

  def show
  end

end
