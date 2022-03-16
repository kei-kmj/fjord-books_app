# frozen_string_literal: true

class UsersController < ApplicationController
  # ログインしていないユーザーのURL直打ちを避ける
  before_action :redirect_root
  before_action :set_user, only: %i[show]

  def index
    @users = User.order(:id).page(params[:page])
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
