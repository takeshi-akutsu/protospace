class NewestController < ApplicationController
  def index
    @prototypes = Prototype.includes([:images, :user]).order("created_at DESC").page(params[:page]).per(8)
  end
end
