class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @shelter    = Shelter.new
    @countries  = Country.all
  end

  def create
  end


  def getRegions
    @regions = Region.where(country_id: params[:country_id]).select(:id, "title_#{I18n.locale} AS 'title'")
    render json: @regions
  end

  def getCities
    @city = City.where(region_id: params[:region_id]).select(:id, "title_#{I18n.locale} AS 'title'")
    render json: @city
  end

  private

  def shelter_params
    params.require(:shelter).permit(:country_id, :region_id)
  end

end
