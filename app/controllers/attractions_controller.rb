class AttractionsController < ApplicationController

    def index
        if logged_in?
            @attractions = Attraction.all
        else
            redirect_to root_path
        end
    end

    def show
        if logged_in?
            @attraction = Attraction.find_by(id: params[:id])
            @ride = @attraction.rides.build(user_id: current_user.id)
        else
            redirect_to root_path
        end
    end

    def new
        if current_user.admin
            @attraction = Attraction.new
        else
            redirect_to current_user, alert: "You must be an admin to create a new attraction"
        end
    end

    def create
        if !!current_user.admin
            attraction = Attraction.create(attraction_params)
            redirect_to attraction
        else
            redirect_to attractions, alert: "You must be an admin to create a new attraction"
        end
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
        if !!current_user.admin
        else
            redirect_to @attraction, alert: "You must be an admin to edit an attraction"
        end
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        if !!current_user.admin
            @attraction.update(attraction_params)
            redirect_to @attraction
        else
            redirect_to @attraction, alert: "You must be an admin to edit an attraction"
        end
    end

    private
    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end
end
