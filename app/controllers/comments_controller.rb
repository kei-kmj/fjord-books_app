# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: [:destroy]

  def create
    params[:comment][:user_id] = current_user.id
    @comment = @commentable.comments.build(comments_params)
    if @comment.save
      redirect_to [@commentable], notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to [@commentable], notice: 'Comment was successfully destroyed.'
  end


  private

  def set_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:comment, :user_id)
  end
end

