module ApplicationHelper

	 def determine_navlinks
		 p request.path
		 if logged_in?

		case request.path

			when '/'
				@link1_name = 'Logged IN'
				@link1 =  'users/new'

				@link2_name = 'Login'
				@link2 = 'login'

			when '/climbs'
				@link1_name = 'climbs'
				@link1 =  'login'

				@link2_name = 'we are climbing'
				@link2 = 'users/new'

			end
		end
	end

end
