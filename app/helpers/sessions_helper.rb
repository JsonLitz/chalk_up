module SessionsHelper

    def login(user)
      session[:user_id] = user.id
      @current_user = user
    end

    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def logged_in?
      session[:user_id]!= nil
    end

    def authenticate_user!
      redirect_to_user_login_path unless current_user
    end

    def logout
      @current_user = session[:user_id] = nil
    end


end
