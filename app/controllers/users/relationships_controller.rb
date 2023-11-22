class Users::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.active_relationships.create!(followed_id: params[:followed_id])
    redirect_to request.referer || root_path
  end

  def destroy
    following = current_user.active_relationships.find_by(followed_id: params[:followed_id])
    following.destroy!
    redirect_to request.referer || root_path
  end
end
