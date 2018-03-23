class HomeController < ApplicationController


  def index
    @geo = Geocoder.search(request.remote_ip)[0].data
    @shelters_list = root_url + 'shelters.json'

    @shelters = Shelter.select(:id, :title, :verified, :cover, "cities.title AS _city", "countries.title AS _country").joins(:city, :country).limit(5).order("created_at DESC")


    @pets = Pet.select(:id, :name, :birthday, :avatar, :vaccination, :sterilization, :euthanasia, :subspecies, :shelter_id, "cities.title AS city", "countries.title AS country").joins(shelter: [:city, :country]).limit(5).order("pets.created_at DESC")
    render layout: "home_layout"
  end

end