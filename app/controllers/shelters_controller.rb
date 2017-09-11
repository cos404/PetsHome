class SheltersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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
    @shelter = Shelter.new(shelter_params)
    @shelter.user_id = current_user.id
    @shelter.save!

    if @shelter.errors.empty?
      flash[:success] = "Shelter added!"
      redirect_to @shelter
    else
      flash.now[:error] = "You have error!"
      render "new"
    end
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
    params.require(:shelter).permit(:title, :street, :house_number, :latitude, :longitude, :description, :cover, :working, :verified, :country_id, :region_id, :city_id)
  end

end
