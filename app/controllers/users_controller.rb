class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show followings followers]

  def index
    @users = User.order(created_at: :desc).page(params[:page])
  end

  def show; end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
