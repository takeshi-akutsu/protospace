class PopularController < ApplicationController
  def index
    @prototypes = Prototype.includes([:images, :user]).order("likes_count DESC").limit(4).page(params[:page]).per(8)
  end
end
