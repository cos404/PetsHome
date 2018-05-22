class Admin::Locations::RegionsController < Admin::ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @regions = Region.order(sort_column + ' ' + sort_direction).select("regions.*, COUNT(distinct cities.id) as cities_count").left_outer_joins(:cities).group('regions.id')

    if params[:country_id]
      @regions = @regions.where(country_id: params[:country_id])
      @region = Region.new(country_id: params[:country_id])
    end
  end

  def create
    @region = Region.new(region_params)
    @region.save

    if @region.errors.empty?
      flash[:success] = "region added!"
    else
      p @region.errors
      flash[:error] = "You have error!"
    end

    redirect_to admin_locations_region_path(@region.country_id)
  end

  private

  def sort_column
    Region.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def region_params
    params.require(:region).permit(:country_id, :title)
  end
end
