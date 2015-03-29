class RantsController < ApplicationController

  def index
     if params[:q]
       search = params[:q][:query]
       @rants = Rant.where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%")
       render json: @rants
     else
       @rants = Rant.all
       render json: @rants
     end
   end

  def show
    @user = User.find(params[:user_id])
    @rant = @user.rants(params[:id])
    render json: @rant
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

  def create
    @user = User.find(params[:rant][:user_id])
    @rant = Rant.new(rant_params)
    @rant.user_id = @user.id
    if @rant.save
      render json: @user.rants.all
    else
      raise "Uh Oh!"
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    render json: @user.rants.all
  end

private

  def rant_params
    params.require(:rant).permit(:title, :body, :user_id)
  end
end
