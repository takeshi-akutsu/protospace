class UsersController < ApplicationController

  before_action :get_user, only: [:show]

  def show
    @prototypes = @user.prototypes.page(params[:page]).per(8)
  end

  def edit
  end

  def update
    if update_params[:password].blank?
      without_password_params = update_params
      without_password_params.delete(:password)
      current_user.update(without_password_params)
    else
      current_user.update(update_params)
    end
    redirect_to root_path
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:nickname, :email, :password, :member, :self_intro, :works, :avatar)
  end
end
