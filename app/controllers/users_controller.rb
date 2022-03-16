class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.order(:id)
  end
end

def show; end

private

def set_user
  @user = User.find(params[:id])
end
