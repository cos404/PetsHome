class Admin::UsersController < Admin::ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :allow_without_password, only: [:update]

  def index
    @users = User.order(sort_column + ' ' + sort_direction)
    authorize [:admin, @users]
  end

  def edit
    @user = User.find(params[:id])
    authorize [:admin, @user]
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)

    if @user.errors.empty?
      redirect_to admin_users_path
    else
      p @user.errors
      render "edit"
    end
  end



private
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def user_params
    params.require(:user).permit(:email, :username, :about, :avatar, :status, :fullname, :email_visible, :role, :password, :password_confirmation)
  end

  def allow_without_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
    end
  end
end
