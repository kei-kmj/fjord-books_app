# frozen_string_literal: true

class UsersController < ApplicationController
  # ログインしていないユーザーのURL直打ち禁止
  before_action :authenticate_user!

  def index
    @users = User.order(:id).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
  end
end
