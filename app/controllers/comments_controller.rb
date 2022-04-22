# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    params[:comment][:user_id] = current_user.id
    @comment = @commentable.comments.build(comments_params)
    if @comment.save
      redirect_to request.referer, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new
    end
  end

  def destroy
    @comment.destroy if @comment.user == current_user
    redirect_to request.referer, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
