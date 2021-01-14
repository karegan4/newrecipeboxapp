class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :require_login
  
      #returns true if there is a user_id in the session hash, indicating a user is signed in
    def logged_in?
      !!session[:user_id]
    end
  
      #returns the instance of a user that is signed in, assigns them to @current_user
    def current_user
      @current_user ||=User.find_by(id: session[:user_id])
    end
  
    def verified_user
      redirect_to '/' unless user_is_authenticated
    end
  
    def user_is_authenticated
      !!current_user
    end

    def require_login
      unless logged_in?
        redirect_to root_path
      end
    end
end
