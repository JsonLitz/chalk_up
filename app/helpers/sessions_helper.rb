module SessionsHelper

    def login(user)
      session[:user_id] = user.id
      @current_user = user
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def authenticate_user!
       if !current_user
         redirect_to login_path
         flash[:error] = "You have to log in!"
       end
    end

    def logout
      @current_user = session[:user_id] = nil
    end


end
