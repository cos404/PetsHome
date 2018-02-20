class Admin::SheltersController < Admin::ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @shelters = Shelter.order(sort_column + ' ' + sort_direction).includes(:country, :user)
  end

  private

  def sort_column
    Shelter.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end