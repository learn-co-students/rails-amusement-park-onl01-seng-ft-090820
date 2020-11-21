class RidesController < ApplicationController

    def create
        @ride = current_user.rides.build(ride_params)
        @user = current_user
        @attraction = Attraction.find_by(id: ride_params[:attraction_id])
        @message = @ride.take_ride
        redirect_to @user, flash: {message: @message}
    end

    private
    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end
