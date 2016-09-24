class UsersController < ApplicationController

  def index
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
    current_user.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :email, :password, :member, :self_intro, :works)
  end
end
