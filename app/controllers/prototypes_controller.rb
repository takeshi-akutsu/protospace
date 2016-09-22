class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: [:new] #まだ適当

  def index
  end

  def new
    @prototype = Prototype.new
  end

  def show
  end
end
