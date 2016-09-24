class UsersController < ApplicationController

  def index
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
    if update_params[:password].blank?
      without_password_params = update_params # この１行を挟まないとダメだった
      without_password_params.delete(:password)
      current_user.update(without_password_params)
      # update_params.delete(:password) # ダメなやり方
      # current_user.update(update_params) # ダメなやり方
    else
      current_user.update(update_params)
    end
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :email, :password, :member, :self_intro, :works)
  end
end
