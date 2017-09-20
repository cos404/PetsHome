class HomeController < ApplicationController


  def index
    ip = '37.214.180.224'                 #
    @geo = Geocoder.search(ip)[0].data    #
    @shelters = root_url + 'shelters.json'#

    @pets = Pet.select(:id, :name, :age_years, :age_months, :birthday, "cities.title_#{I18n.locale} AS city").joins(shelter: :city).limit(8)
    render layout: "home_layout"
  end


end

