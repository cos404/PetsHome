class Admin::HomeController < Admin::ApplicationController

  def index
    @pets = Pet.count
    @shelters = Shelter.count
    @users = User.count
  end

end
