class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: [:new] #まだ適当
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

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
    prototype = Prototype.find(params[:id])
    success = prototype.update(prototype_params) if (user_signed_in?) && (current_user.id == @prototype.user.id)
    if success
      flash[:success] = "更新に成功しました"
    else
      flash[:error] = "更新に失敗しました"
    end
    binding.pry
    redirect_to action: :show
  end

  def destroy
    @prototype.destroy
    redirect_to root_path
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:id, :image, :status])
  end
end
