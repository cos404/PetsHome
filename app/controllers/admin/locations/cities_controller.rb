class Admin::Locations::CitiesController < Admin::ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @cities = City.order(sort_column + ' ' + sort_direction).select("cities.*, COUNT(distinct shelters.id) as shelters_count").left_outer_joins(:shelter).group('cities.id')

    if params[:region_id]
      @cities = @cities.where(region_id: params[:region_id])
      @city = City.new(region_id: params[:region_id])
      @city.country_id = Region.find(params[:region_id]).country_id
    end
  end

  def create
    @city = City.new(city_params)
    @city.save

    if @city.errors.empty?
      flash[:success] = "city added!"
    else
      p @city.errors
      flash[:error] = "You have error!"
    end

    redirect_to admin_locations_city_path(@city.region_id)
  end

  private

  def sort_column
    City.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def city_params
    params.require(:city).permit(:country_id, :region_id, :title)
  end
end
