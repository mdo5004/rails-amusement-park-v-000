class AttractionsController < ApplicationController
def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            session[:attraction_id] = @attraction.id
            redirect_to root_path, :alert => "Successfully signed in"
        else 
            render :new
        end
    end
    
    def index
        @attractions = Attraction.all
    end
    def show
        @attraction = Attraction.find(params[:id])
    end
    def edit
        @attraction = Attraction.find(params[:id])  
    end
    def update
        @attraction = Attraction.find(params[:id])     
        if @attraction.update(attraction_params)
            redirect_to attractions_path
        else
            render :edit, :alert => "Failed to update"
        end
    end
    def destroy
        @attraction = Attraction.find(params[:id])     
        @attraction.destroy
    end
    
    private
    def attraction_params
        params.require(:attraction).permit(:name, :password, :min_height, :tickets, :nausea_rating, :happiness_rating)
    end
end    
