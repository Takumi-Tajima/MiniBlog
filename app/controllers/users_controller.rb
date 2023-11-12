class UsersController < ApplicationController

  def index
    @users = User.order(created_at: :desc).page(1).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

end
