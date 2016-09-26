class UsersController < ApplicationController

  def show
    @user = current_user #あとで直す
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
  def update_params
    params.require(:user).permit(:nickname, :email, :password, :member, :self_intro, :works)
  end
end
