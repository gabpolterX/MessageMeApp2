class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:sucess] = "Logged in succesfully"
            redirect_to root_path
        else
            flash.now[:error] = "There was something wrong"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:notice] = "You logged out"
        redirect_to login_path
    end


end