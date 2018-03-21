class PetPhotosController < ApplicationController
  before_action :find_photo, only: [:destroy]

  def destroy
    @pet = @photo.pet
    authorize @pet

    @photo.destroy
  end

  def create
    @pet = Pet.find(params[:pet_id])
    authorize @pet

    @photo = PetPhoto.new(pet_params)
    @photo.user_id = current_user.id
    @photo.pet_id = params[:pet_id]
    @photo.save
  end

  private

  def find_photo
    @photo = PetPhoto.find(params[:id])
  end

  def pet_params
    params.require(:photo).permit(:title)
  end
end