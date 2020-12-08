class ApplicationController < ActionController::Base
    helper_method :current_user, :log_in_user!, :logged_in?

    def current_user
        User.find_by( session_token: session[:session_token] )
    end

    def log_in_user!(user)
        current_user.reset_session_token
        session[:session_token] = nil    
    end

    def logged_in?
        current_user != nil
    end
end
