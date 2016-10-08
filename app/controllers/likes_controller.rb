class LikesController < ApplicationController

  def create
    like = Like.create(like_params)
    @prototype = like.prototype
  end

  def destroy
    like = Like.find_by(like_params)
    like.destroy if user_signed_in? && like.user == current_user
    @likes = Like.where(prototype_id: like_params[:prototype_id]) #@likesじゃなくて、createのときと同様に@prototypeを送った方がいいかも？統一する
  end

  private

  def like_params
    params.require(:like).permit(:prototype_id, :user_id)
  end


end
