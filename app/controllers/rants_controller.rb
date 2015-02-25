class RantsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    render json: @user.rants.all
  end
  
end
