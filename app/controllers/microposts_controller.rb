# frozen_string_literal: true

class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[show]

  def index
    @microposts = Micropost.includes(:user).order(updated_at: :desc)
  end

  def show; end

  private

  def set_micropost
    @micropost = Micropost.find(params[:id])
  end
end
