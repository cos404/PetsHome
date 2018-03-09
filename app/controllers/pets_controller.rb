class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_pet, only: [:show, :edit, :update]
  before_action :find_shelter, only: [:new, :create]

  def index
    @pets = Pet.all
  end

  def show
  end

  def edit
    authorize  @pet
  end

  def update
    @pet.update_attributes(pet_params)
    authorize  @pet
    if @pet.errors.empty?
      redirect_to @pet
    else
      render "edit"
    end
  end

  def new
    @pet = Pet.new(shelter_id: @shelter.id)
    authorize  @shelter
  end

  def create
    @pet = Pet.new(pet_params)
    authorize @shelter

    @pet.user_id = current_user.id
    @pet.shelter_id = @shelter.id
    @pet.save!

    if @pet.errors.empty?
      flash[:success] = "Pet added!"
      redirect_to @pet
    else
      flash.now[:error] = "You have error!"
      render "new"
    end

  end

  private

  def pet_params
    params.require(:pet).permit(:subspecies, :name, :birthday, :euthanasia, :size, :gender, :vaccination, :diseases, :sterilization, :color, :avatar, :status, :about, :cover, :shelter_id, :status)
  end

  def find_pet
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def find_shelter
    @shelter = Shelter.find(params[:shelter_id])
  end

end
