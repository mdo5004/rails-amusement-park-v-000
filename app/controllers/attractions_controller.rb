class AttractionsController < ApplicationController
    def new
        @attraction = Attraction.new
        authorize @attraction
    end

    def create
        @attraction = Attraction.new(attraction_params)
        authorize @attraction
        if @attraction.save
            redirect_to attraction_path(@attraction), :alert => "Attraction Created"
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
        authorize @attraction
    end
    def update
        @attraction = Attraction.find(params[:id])     
        if attraction_params[:users]
            # user is taking a ride
            message = @attraction.take_ride(attraction_params[:users]) 
            redirect_to user_path(attraction_params[:users]), :alert => message
        else
            if @attraction.update(attraction_params)
                # someone is trying to update the attraction itself
                authorize @attraction
                redirect_to attraction_path(@attraction)
            else
                render :edit, :alert => "Failed to update"
            end
        end
    end
    def destroy
        @attraction = Attraction.find(params[:id])     
        authorize @attraction
        @attraction.destroy
    end

    private
    def attraction_params
        params.require(:attraction).permit(:name, :password, :min_height, :tickets, :nausea_rating, :happiness_rating, :users)
    end
end    
