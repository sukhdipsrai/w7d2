class UserControllerController < ApplicationController
    def create
        user = User.new(user_params)
        user.save
        
        if user
            user.reset_session_token
            session[:sesion_token] = user.sesion_token
            render "Account Created and Logged On"
        else
            render "Account Not Created"
        end

    end

    def new
    end

    def show
    end
end
