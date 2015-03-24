class UsersController < ApplicationController

  before_filter :authenticate_user!, only: [:delete]
  skip_before_filter :verify_authenticity_token

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      render json: @user
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: User.find(@user.id)
    else
      render json: User.all
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: User.all
  end

  private

  def user_params
    (params.require(:user).permit(:email, :first_name, :last_name, :password))
  end
end
