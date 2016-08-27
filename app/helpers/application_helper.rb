module ApplicationHelper

	 def determine_navlinks
		 p request.path
		p logged_in?
	 	p current_user
		 if session[:user_id] != nil
			case request.path

					when '/'
						homepage
						

					when '/climbs'
			end
		else
			not_logged_in_nav
		 	
		end
	end

	def not_logged_in_nav
				@link1_name = 'Sign Up'
				@link1 =  'users/new'
				@link2_name = 'Login'
				@link2 = 'login'
	end

	def homepage
				@link1_name = 'logout'
				@link1 =  'logout'

				@link2_name = 'Profile'
				@link2 = 'user/'+ session[:user_id].to_s
		
	end

end
