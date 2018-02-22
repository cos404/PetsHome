class SheltersController < ApplicationController
  before_action :authenticate_user!,  only: [:new, :create, :edit, :update, :destroy]
  before_action :find_shelter,        only: [:show, :edit, :update, :destroy]

  def index
    @shelters = Shelter.all
  end

  def show
    @schedules = @shelter.schedules.sort_by do |a|
      @shelter.schedules.day_of_weeks[a.day_of_week]
    end
  end

  def edit
    7.times do |i|
      day = @shelter.schedules.day_of_weeks.key(i)
      unless @shelter.schedules.any?{|j| j.day_of_week == day}
        @shelter.schedules.build(day_of_week: day)
      end
    end

    @schedules = @shelter.schedules.sort_by do |a|
      @shelter.schedules.day_of_weeks[a.day_of_week]
    end

    authorize @shelter
  end

  def update
    @shelter.update_attributes(shelter_params)

    # DELETE DAYS WITH BLANK TIME
    params[:shelter][:schedules_attributes].each do |key, value|
      if value[:id]
        Schedule.find(value[:id]).destroy  if value[:open].blank? || value[:close].blank?
      end
    end

    if @shelter.errors.empty?
      redirect_to @shelter
    else
      render "edit"
    end
  end

  def new
    @shelter    = Shelter.new
    @countries  = Country.all
    @schedules = []

    7.times{ |i|
      day = @shelter.schedules.day_of_weeks.key(i)
      @schedules << @shelter.schedules.build(day_of_week: day)
    }
    authorize @shelter
  end

  def create
    @shelter = Shelter.new(shelter_params)
    @shelter.user_id = current_user.id
    @shelter.save!

    if @shelter.errors.empty?
      ShelterPhoto.where(user_id: current_user.id, shelter_id: nil).update_all(shelter_id: @shelter.id)
      flash[:success] = "Shelter added!"
      redirect_to @shelter
    else
      flash.now[:error] = "You have error!"
      render "new"
    end
    authorize @shelter
  end


  def getRegions
    @regions = Region.where(country_id: params[:country_id]).select(:id, "title_#{I18n.locale} AS title")
    render json: @regions
  end

  def getCities
    @city = City.where(region_id: params[:region_id]).select(:id, "title_#{I18n.locale} AS title")
    render json: @city
  end

  def getUsers
    @users = User.all.select(:id, :username).order(username: :desc)
    render json: @users
  end

  def addStaff
    @shelter = Shelter.find(shelter_staff_params[:shelter_id])
    @staff = @shelter.shelter_staffs.create(shelter_staff_params)
    render json: @staff
  end

  def deleteStaff
    @staff = ShelterStaff.where(
      user_id: shelter_staff_params[:user_id],
      shelter_id: shelter_staff_params[:shelter_id]
    )
    @staff.destroy_all
  end

  private

  def shelter_params
    params.require(:shelter).permit(:title, :street, :house_number, :latitude, :longitude, :about, :cover, :moderation, :verified, :country_id, :region_id, :city_id, :status, :photo, schedules_attributes:[:open, :close, :day_of_week, :work_day, :id])
  end

  def shelter_staff_params
    params.permit(:shelter_id, :user_id, :role)
  end

  def find_shelter
    @shelter = Shelter.select("shelters.*, countries.title_#{I18n.locale} AS country_title, regions.title_#{I18n.locale} AS region_title, cities.title_#{I18n.locale} AS city_title").joins(:country, :region, :city).find(params[:id])
    authorize @shelter
  end

end
