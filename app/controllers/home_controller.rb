class HomeController < ApplicationController

  def index
    @geo = Geocoder.search(request.remote_ip)[0].data
    # @geo = Geocoder.search('37.214.255.255')[0].data
    @shelters_list = root_url + 'shelters.json'

    @shelters = Shelter.select(:id, :title, :verified, :cover, "cities.title AS _city", "countries.title AS _country").joins(:city, :country).where(moderation: true, status: :active).near([@geo['latitude'], @geo['longitude']], 12000, units: :km).limit(4)

    @pets = Pet.select(:id, :name, :birthday, :avatar, :vaccination, :sterilization, :euthanasia, :subspecies, :shelter_id, "cities.title AS city", "countries.title AS country").joins(shelter: [:city, :country]).limit(4).order("pets.created_at DESC")
    render layout: "home_layout"
  end

end