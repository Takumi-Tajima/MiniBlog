class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to user_profile_path, success: '名前/プロフィールを更新しました', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile)
  end
end
