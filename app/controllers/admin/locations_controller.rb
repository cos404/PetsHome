class Admin::LocationsController < Admin::ApplicationController

  def index
    @countries = Country.all
  end



end
