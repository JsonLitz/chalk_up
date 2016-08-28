module ApplicationHelper
  def determine_navlinks
    @links = []
    @link_names = []

    if session[:user_id] != nil || @current_user != nil
      logged_in_nav
    else
      not_logged_in_nav
    end
  end

  def not_logged_in_nav
    public_routes
  end

  def logged_in_nav
    member_routes
  end

  def member_routes
    @links << ('/users/'+ session[:user_id].to_s) << '/logout' << '/climbs'
    @link_names << 'Profile' << 'Logout' << 'Map'
  end

  def public_routes
    @links << '/climbs'<< '/login'<< '/users/new'
    @link_names << 'Map'<< 'Login'<< 'Sign Up'
  end
	def determine_navlinks
		@links = []
		@link_names = []

		if session[:user_id] != nil || @current_user != nil
			logged_in_nav
		else
			not_logged_in_nav
		end
	end

	def not_logged_in_nav
		public_routes
	end

	def logged_in_nav
		member_routes
	end

	def member_routes
		@links << ('/users/'+ session[:user_id].to_s) << '/logout' << '/climbs'
		@link_names << 'Profile' << 'Logout' << 'Map'
	end

	def public_routes
		@links << '/climbs'<< '/login'<< '/users/new'
		@link_names << 'Map'<< 'Login'<< 'Sign Up'
	end
end
