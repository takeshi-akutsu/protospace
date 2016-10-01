class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: [:new] #まだ適当

  def index
    @prototypes = Prototype.includes(:images).includes(:user) #2こかいていいのかな？
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def create
    prototype = Prototype.create(title: create_params[:title], catch_copy: create_params[:catch_copy], concept: create_params[:concept], user_id: current_user.id)
    create_params[:images_attributes].each do |hash|
      Image.create(image: hash[1][:image], prototype_id: prototype.id, status: hash[1][:status]) if hash[1][:image]
    end
    redirect_to root_path
  end

  private

  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:image, :status])
  end
end
