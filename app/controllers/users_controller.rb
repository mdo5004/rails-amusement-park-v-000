class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, :alert => "Successfully signed in"
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
end