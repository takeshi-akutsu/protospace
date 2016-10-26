class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @prototypes = Prototype.tagged_with(params[:id]).page(params[:page]).per(8)
  end
end
