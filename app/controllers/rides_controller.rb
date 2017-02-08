class RidesController < ApplicationController
  def create
    @user = current_user
    @attraction = Attraction.find(params[:attraction_id])

    if @attraction && @user
      @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)

      if @ride.ride_error?
        flash[:alert] = @ride.ride_error_text
      else
        @ride.take_ride
        flash[:notice] = "Thanks for riding the #{@attraction.name}!"
      end
    end

    redirect_to user_path(@user)
  end
end
