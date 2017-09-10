class HomeController < ApplicationController


  def index
    @shelters = root_url + 'shelters.json'

    ip = '37.214.180.224'
    @geo = Geocoder.search(ip)[0].data

    render layout: "home_layout"
  end


end
