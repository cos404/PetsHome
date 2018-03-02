class Admin::SettingsController < Admin::ApplicationController

  def index

  end

  def location_index
    @countries = Country.all
    @country = Country.new
  end

  ## COUNTRY CREATE\DELETE
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

  ## REGION CREATE\DELETE
    def get_regions
      @regions = Region.where(country_id: params[:country_id]).select(:id, :title)
      render json: @regions
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

    def destroy_region
      @region = Region.find(params[:id])
      if @region
        @region.destroy
        render json: @region
      else
        render json: {message: "ERROR"}, status: 500
      end
    end

  ## CITY CREATE\DELETE
    def get_cities
      @cities = City.where(region_id: params[:region_id]).select(:id, :title)
      render json: @cities
    end

    def create_city
      @city = City.new(city_params)
      @city.save
      if @city.errors.empty?
        flash[:success] = "city added!"
        redirect_to admin_location_path
      else
        flash.now[:error] = "You have error!"
        redirect_to admin_location_path
      end
    end

    def destroy_city
      @city = City.find(params[:id])
      if @city
        @city.destroy
        render json: @city
      else
        render json: {message: "ERROR"}, status: 500
      end
    end

  ## SHELTER MAP JSON GENERATE
  def generateSheltersJSON
    shelters = {
      "type":"FeatureCollection",
    }

    shelters_list = Shelter.all.select(:id, :title, :street, :house_number, :latitude, :longitude, :about)
    shelters[:features] = shelters_list.map do |shelter|
      {
        type: "Feature",
        id: shelter.id,
        geometry: {
          type: "Point",
          coordinates: [shelter.latitude, shelter.longitude]
        },
        properties: {
          balloonContentHeader: shelter.title,
          balloonContentBody: "<br><p>#{shelter.about}</p><p>Адрес: #{shelter.street} #{shelter.house_number}</p>",
          clusterCaption: shelter.title,
          hintContent: shelter.title
        }
      }
    end

    File.open("public/shelters.json","w") do |f|
      f.write(shelters.to_json)
    end

    render json: {message: "Shelters list generated!"}, status: 200
  end


  private

  def country_params
    params.require(:country).permit(:title)
  end

  def region_params
    params.require(:region).permit(:title, :country_id)
  end

  def city_params
    params.require(:city).permit(:title, :region_id)
  end

end