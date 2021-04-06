class Admin::HomeController < Admin::ApplicationController

  def index
    @pets_count = Pet.count
    @shelters_count = Shelter.count
    @users_count = User.count
    @comments_count = Comment.count
  end

end
