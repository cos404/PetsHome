class SheltersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_shelter, only: [:show, :edit, :update, :destroy]

  def index
    @shelters = Shelter.all
  end

  def show
  end

  def edit
  end

  def update
    @shelter.update_attributes(shelter_params)

    if @shelter.errors.empty?
      redirect_to @shelter
    else
      render "edit"
    end
  end

  def new
    @shelter    = Shelter.new
    @countries  = Country.all
    @schedules = []

    7.times{ |i|
      day = @shelter.schedules.day_of_weeks.key(i)
      @schedules << @shelter.schedules.build(day_of_week: day)
    }
  end

  def create
    @shelter = Shelter.new(shelter_params)
    @shelter.user_id = current_user.id
    @shelter.save!

    if @shelter.errors.empty?
      ShelterPhoto.where(user_id: current_user.id, shelter_id: nil).update_all(shelter_id: @shelter.id)

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
    params.require(:shelter).permit(:title, :street, :house_number, :latitude, :longitude, :about, :cover, :working, :verified, :country_id, :region_id, :city_id, :photo, schedules_attributes:[:open, :close, :day_of_week, :work_day])
  end

  def find_shelter
    @shelter = Shelter.select("shelters.*, countries.title_#{I18n.locale} AS country_title, regions.title_#{I18n.locale} AS region_title, cities.title_#{I18n.locale} AS city_title").joins(:country, :region, :city).find(params[:id])
  end

end
