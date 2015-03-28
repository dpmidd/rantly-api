class RantsController < ApplicationController

  skip_before_filter :authenticate_user!

  def index
    render json: Rant.all
  end

  def show
    @user = User.find(params[:user_id])
    @rant = @user.rants(params[:id])
    render json: @rant
  end

  def create
    @user = User.find(params[:user_id])
    @rant = Rant.new(rant_params)
    @rant.user_id = @user.id
    if @rant.save
      render json: @user.rants.all
    else
      raise "oh no!"
    end
  end

  def update
    @user = User.find(params[:rant][:user_id])
    @rant = @user.rants.find(params[:id])
    if @rant.update(rant_params)
      render json: @rant
    else
      render json: @user.rants.all
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @rant = @user.rants.find(params[:id])
    @rant.destroy
    render json: Rant.all
  end

  private

  def rant_params
    params.require(:rant).permit(:title, :body, :user_id)
  end
end
