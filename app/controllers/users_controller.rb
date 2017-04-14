require "pry"
class UsersController < ApplicationController
rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user), :alert => "Successfully signed in"
        else 
            render :new
        end
    end
    
    def index
        @users = User.all
        authorize @users
    end
    def show
        @user = User.find(params[:id])
        authorize @user
    end
    def edit
        @user = User.find(params[:id])     
        authorize @user
    end
    def update
        @user = User.find(params[:id])
        authorize @user
    end
    def destroy
        @user = User.find(params[:id])     
        authorize @user
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :password, :height, :tickets, :nausea, :happiness, :admin)
    end
    
    def authenticate_user!
        if !session[:user_id]
            redirect_to root_path, :alert => "Access denied."
        end
    end
    
    def user_not_authorized
        redirect_to users_path, :alert => "Access denied."
    end
end