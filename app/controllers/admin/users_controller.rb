class Admin::UsersController < Admin::ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @users = User.order(sort_column + ' ' + sort_direction)
    authorize [:admin, @users]
  end

private
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
