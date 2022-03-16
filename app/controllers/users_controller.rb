class UsersController < ApplicationController
  # ログインしていないユーザーの直打ちを避ける
  before_action :redirect_root
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.order(:id)
  end
end

def show; end

private

def redirect_root
  redirect_to root_path unless user_signed_in?
end

def set_user
  @user = User.find(params[:id])
end
