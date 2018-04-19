class SearchController < ApplicationController

  def index
    @search = Pet.includes(:shelter, shelter:[:city, :country]).where(status: 0).search(params[:q])
    @pets = @search.result.paginate(page: params[:page], per_page: 10)

    @subspecies = params[:q][:subspecies_eq] if params[:q] && params[:q][:subspecies_eq]
    @gender     = params[:q][:gender_eq] if params[:q] && params[:q][:gender_eq]
    @size       = params[:q][:size_eq] if params[:q] && params[:q][:size_eq]
  end

end