class Admin::SettingsController < Admin::ApplicationController

  def location_index
    @countries = Country.all
    @country = Country.new
  end

  def create_country
    @country = Country.new(country_params)
    @country.save
    if @country.errors.empty?
      flash[:success] = "country added!"
      redirect_to admin_location_path
    else
      @countries = Country.all
      flash.now[:error] = "You have error!"
      render :location_index
    end
  end

  def destroy_country
    @country = Country.find(params[:id])
    if @country
      @country.destroy
      render json: @country
    else
      render json: {message: "ERROR"}, status: 500
    end
  end

  def create_region
    @region = Region.new(region_params)
    @region.save
    if @region.errors.empty?
      flash[:success] = "region added!"
      redirect_to admin_location_path
    else
      flash.now[:error] = "You have error!"
      redirect_to admin_location_path
    end
  end

  def get_regions
    @regions = Region.where(country_id: params[:country_id]).select(:id, "title_#{I18n.locale} AS 'title'")
    render json: @regions
  end

  private

  def country_params
    params.require(:country).permit(:title_en, :title_ru, :title_be, :title_fr, :title_de, :title_es)
  end

  def region_params
    params.require(:region).permit(:title_en, :title_ru, :title_be, :title_fr, :title_de, :title_es, :country_id)
  end

end