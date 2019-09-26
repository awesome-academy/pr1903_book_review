class UsersController < ApplicationController
  before_action :find_user, except: [:index]

  def index
    @users = User.all
  end

  def show

  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.required(:user).permit(:email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
