class Admin::Locations::CountriesController < Admin::ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @countries = Country.order(sort_column + ' ' + sort_direction).select("countries.*, COUNT(distinct regions.id) as regions_count", "countries.*, COUNT(distinct cities.id) as cities_count").left_outer_joins(:regions, :cities).group('countries.id')

    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    @country.save

    if @country.errors.empty?
      flash[:success] = "country added!"
    else
      flash[:error] = "You have error!"
    end

    redirect_to admin_locations_path
  end

  private

  def sort_column
    Country.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def country_params
    params.require(:country).permit(:title, :lookup_code)
  end
end
