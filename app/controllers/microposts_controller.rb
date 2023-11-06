# frozen_string_literal: true

class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[show edit update destroy]

  def index
    @microposts = Micropost.order(created_at: :desc)
  end

  def show; end

  def new
    @micropost = Micropost.new
  end

  def edit; end

  def create
    @micropost = Micropost.new(micropost_params)
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
    @micropost = Micropost.find(params[:id])
  end

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
