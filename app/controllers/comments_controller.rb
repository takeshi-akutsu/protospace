class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    comment = current_user.comments.create(comment_params)
    @comments = comment.prototype.comments
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(prototype_id: params[:prototype_id])
  end
end
