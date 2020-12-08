class SessionControllerController < ApplicationController

    def show
    end
    
        private
        def user_params
            params.require(:users).permit(:email,:password)
        end
    def new
    # sign in form
    end

    def create 
    # attempt login, from form
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user
            user.reset_session_token
            session[:session_token] = user.session_token
            render "User Logged IN"
        else
            render "Wrong password"
        end
    end


    def destory
        if logged_in?
            log_in_user!(current_user)
        end
        render "user logged out"
    end

end
