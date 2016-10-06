class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: [:new] #まだ適当
  before_action :set_prototype, only: [:show, :edit, :update]

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
    redirect_to root_path
  end

  def edit
  end

  def update
    binding.pry
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params) if (user_signed_in?) && (current_user.id == @prototype.user.id)
    redirect_to action: :show
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:id, :image, :status])
  end
end
