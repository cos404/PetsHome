class UsersController < ApplicationController

  def show
    # @user = User.find(params[:id])
    @user = User.find_by(username: params[:username])

    if @user.nil?
      render file: "#{Rails.root}/public/404", status: :not_found
    else
      authorize @user
    end

  end

end