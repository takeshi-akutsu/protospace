class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: [:new] #まだ適当
  before_action :get_prototype, only: [:show]

  def index
    @prototypes = Prototype.includes([:images, :user]).page(params[:page]).per(8)
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def show
  end

  def create
    current_user.prototypes.create(prototype_params)
    # prototype.images.each do |image|
    #   Image.create(image: image.image, status: image.status, prototype_id: image.prototype_id)
    # end
    redirect_to root_path
  end

  private

  def get_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:image, :status])
  end
end
