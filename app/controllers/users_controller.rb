class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)

    if @user.errors.empty?
      redirect_to @user
    else
      render "edit"
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :status, :avatar, :fullname, :about)
  end

  def find_user
    @user = User.find(params[:id])
    authorize @user
  end

end
