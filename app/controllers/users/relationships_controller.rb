class Users::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to request.referer || root_path
  end

  def destroy
    user = current_user.followings.find(params[:id])
    current_user.unfollow(user)
    redirect_to request.referer || root_path
  end
end
