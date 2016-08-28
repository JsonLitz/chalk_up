class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :determine_navlinks

  protect_from_forgery with: :exception

  include SessionsHelper
  include ApplicationHelper

end
