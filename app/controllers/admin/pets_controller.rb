class Admin::PetsController < Admin::ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @pets = Pet.includes(:shelter,  shelter:[:country]).order(sort_column + ' ' + sort_direction)
    p @pets
  end

  private

  def sort_column
    Pet.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end
end
