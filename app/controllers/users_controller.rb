class UsersController < ApplicationController
  before_action :authenticate, only: [:show]

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,
                                 :height,
                                 :happiness,
                                 :tickets,
                                 :nausea,
                                 :admin,
                                 :password)
  end
end
