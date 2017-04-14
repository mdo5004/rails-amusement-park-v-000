class UsersController < ApplicationController
    before_action :authenticate_user!
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
    end
    def show
        @user = User.find(params[:id])
    end
    def edit
        @user = User.find(params[:id])     
    end
    def update
    end
    def destroy
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :password, :height, :tickets, :nausea, :happiness)
    end
    
    def authenticate_user!
        !!session[:user_id] 
    end
end