class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new] #まだ適当
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root, only: [:edit]

  def index
    @prototypes = Prototype.includes([:images, :user]).order_newest.page(params[:page]).per(8)
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def show
    prototype = Prototype.find(params[:id])
    @like = prototype.like_user(current_user)
    @comment = Comment.new
    @comments = prototype.comments
  end

  def create
    current_user.prototypes.create(prototype_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    prototype = Prototype.find(params[:id])
    if current_user == @prototype.user && prototype.update(prototype_params)
      flash[:success] = "更新に成功しました"
    else
      flash[:danger] = "更新に失敗しました"
    end
    redirect_to action: :show
  end

  def destroy
    @prototype.destroy if current_user == @prototype.user
    redirect_to root_path
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:id, :image, :status])
  end

  def redirect_to_root
      redirect_to root_path unless current_user == @prototype.user
  end
end
