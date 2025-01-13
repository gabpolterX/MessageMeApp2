class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]

    def new

    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          cookies.encrypted[:user_id] = user.id 
          flash[:success] = "Logged in successfully"
          redirect_to root_path
        else
          flash[:error] = "There was something wrong"
          redirect_to login_path
        end
      end
    
    def destroy
        session[:user_id] = nil
        cookies.delete(:user_id)
        flash[:notice] = "You logged out"
        redirect_to login_path
    end

    private

    def logged_in_redirect
        if logged_in?
            flash[:error] = "You are already logged in"
            redirect_to root_path
        end
    end

end