class UsersController < ApplicationController

  def show
    @user = User.find_by(username: params[:username])
    if @user.nil?
      render_404
    else
      authorize @user
      @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: @user.id, owner_type: "User")
    end
  end

end