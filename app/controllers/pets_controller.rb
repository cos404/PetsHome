class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  private

  def pet_params
    params.require(:pet).permit(:title, :street, :house_number, :latitude, :longitude, :description, :cover, :working, :verified, :country_id, :region_id, :city_id)
  end

  def find_pet
    @pet = Pet.find(params[:id])

    # select("shelters.*, countries.title_#{I18n.locale} AS country_title, regions.title_#{I18n.locale} AS region_title, cities.title_#{I18n.locale} AS city_title").joins(:country, :region, :city).find(params[:id])
  end

end
