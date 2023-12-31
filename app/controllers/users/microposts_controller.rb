# frozen_string_literal: true

class Users::MicropostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_micropost, only: %i[edit update destroy]

  def index
    @microposts = current_user.feeds.order(updated_at: :desc)
  end

  def new
    @micropost = Micropost.new
  end

  def edit; end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to @micropost, success: '新規投稿を作成しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @micropost.update(micropost_params)
      redirect_to @micropost, success: '投稿を更新しました。', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @micropost.destroy!
    redirect_to microposts_url, success: '投稿を削除しました。', status: :see_other
  end

  private

  def set_micropost
    @micropost = current_user.microposts.find(params[:id])
  end

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
