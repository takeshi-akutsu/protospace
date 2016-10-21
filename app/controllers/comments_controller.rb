class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    current_user.comments.create(comment_params)
    redirect_to prototype_path(params[:prototype_id])
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(prototype_id: params[:prototype_id])
  end
end
