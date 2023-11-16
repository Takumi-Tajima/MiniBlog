class UsersController < ApplicationController

  def index
    @users = User.order(created_at: :desc).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
  # todo - User.find(params[:id])を共通化してもいいかも
  def followings
		user = User.find(params[:id])
		@users = user.followings
	end

  def followers
		user = User.find(params[:id])
		@users = user.followers
	end

end
