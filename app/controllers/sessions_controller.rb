require 'pry'
class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.find_by(name: session_params[:name])
        if @user && @user.authenticate(session_params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
#            render :new, :alert => "Failed login attempt."
            redirect_to new_user_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    private
    def session_params
        params.require(:user).permit(:name, :password)
    end
end