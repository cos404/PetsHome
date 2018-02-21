class Admin::SheltersController < Admin::ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @shelters = Shelter.order(sort_column + ' ' + sort_direction).includes(:country, :user)
  end

  def edit
    @shelter = Shelter.includes(:country).find(params[:id])
    @countries = Country.where(id: @shelter.country_id)
    @regions = Region.where(id: @shelter.region_id)

    7.times do |i|
      day = @shelter.schedules.day_of_weeks.key(i)
      unless @shelter.schedules.any?{|j| j.day_of_week == day}
        @shelter.schedules.build(day_of_week: day)
      end
    end

    @schedules = @shelter.schedules.sort_by do |a|
      @shelter.schedules.day_of_weeks[a.day_of_week]
    end

    authorize [:admin, @shelter]
  end

  def update
    @shelter = Shelter.find(params[:id])
    @shelter.update_attributes(shelter_params)

    if @shelter.errors.empty?
      redirect_to admin_shelters_path
    else
      p @shelter.errors
      render "edit"
    end
  end

  def getRegions
    @regions = Region.where(country_id: params[:country_id]).select(:id, "title_#{I18n.locale} AS title")
    render json: @regions
  end

  def getCities
    @city = City.where(region_id: params[:region_id]).select(:id, "title_#{I18n.locale} AS title")
    render json: @city
  end

  private

  def sort_column
    Shelter.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def shelter_params
    params.require(:shelter).permit(:title, :street, :house_number, :latitude, :longitude, :about, :cover, :working, :verified, :country_id, :region_id, :city_id, :photo, schedules_attributes:[:open, :close, :day_of_week, :work_day, :id])
  end
end