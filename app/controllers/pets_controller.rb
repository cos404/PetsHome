class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_pet, only: [:show, :edit, :update, :destroy]
  before_action :find_shelter, only: [:new, :create]

  def index
    @pets = Pet.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @pet = Pet.new(shelter_id: @shelter.id)
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @pet.shelter_id = @shelter.id
    @pet.euthanasia_date = nil if @pet.euthanasia.to_i.zero?
    @pet.save!

    if @pet.errors.empty?
      PetPhoto.where(user_id: current_user.id, pet_id: nil).update_all(pet_id: @pet.id)

      flash[:success] = "Pet added!"
      redirect_to shelter_pet_path(@shelter, @pet)
    else
      flash.now[:error] = "You have error!"
      render "new"
    end

    authorize @pet
  end

  private

  def pet_params
    params.require(:pet).permit(:subspecies, :name, :birthday, :euthanasia, :euthanasia_date, :size, :gender, :vaccination, :diseases, :sterilization, :color, :avatar, :finished, :finished_description, :about, :cover, :shelter_id)
  end

  def find_pet
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def find_shelter
    @shelter = Shelter.find(params[:shelter_id])
  end

end
