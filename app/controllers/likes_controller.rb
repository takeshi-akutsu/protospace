class LikesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @prototype = @like.prototype
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy if like.user == current_user
    @prototype = Prototype.find(params[:prototype_id])
  end
end
