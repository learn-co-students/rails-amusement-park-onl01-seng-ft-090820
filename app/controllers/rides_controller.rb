class RidesController < ApplicationController

    def create 
        # binding.pry
        @ride = Ride.create(ride_params)
        @msg = @ride.take_ride 
        redirect_to user_path(@ride.user), :flash => {alert: @msg}
    end 


    private 
    def ride_params 
        params.permit(:user_id, :attraction_id)
    end 
end 