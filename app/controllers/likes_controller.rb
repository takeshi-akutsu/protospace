class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    # @likes = Like.where(prototype_id: @like.prototype)
    @prototype = @like.prototype
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy if user_signed_in? && like.user == current_user
    # @likes = Like.where(prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
  end


end
