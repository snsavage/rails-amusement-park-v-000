class RidesController < ApplicationController
  def create
    flash[:alert] = "This controller doesn't work yet."
    @user = current_user
    redirect_to user_path(@user)
  end
end
