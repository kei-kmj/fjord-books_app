# frozen_string_literal: true

class UsersController < ApplicationController
  # ログインしていないユーザーのURL直打ちを避ける
  before_action :redirect_root

  def index
    @users = User.order(:id).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end
end
