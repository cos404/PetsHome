class UsersController < ApplicationController

  def show
    @user = User.find_by(username: params[:username])
    if @user.nil?
      render_404
    else
      authorize @user
    end
  end

end