class HomeController < ApplicationController

  def index
    geo = Geocoder.search("204.57.220.1")[0].data["city"]

  end


end
