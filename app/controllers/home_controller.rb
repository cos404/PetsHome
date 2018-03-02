class HomeController < ApplicationController


  def index
    @geo = Geocoder.search(request.remote_ip)[0].data
    @shelters = root_url + 'shelters.json'

    @pets = Pet.select(:id, :name, :birthday, :avatar, :shelter_id, "cities.title AS city").joins(shelter: :city).limit(8)
    render layout: "home_layout"
  end

end