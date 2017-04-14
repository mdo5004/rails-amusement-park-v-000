class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.find_by(name: session_params[:name])
        if @user && @user.authenticate(session_params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new, :alert => "Failed login attempt."
        end
    end

    def destroy
        session[:user_id] = nil
    end

    private
    def session_params
        params.permit(:name, :password)
    end
end