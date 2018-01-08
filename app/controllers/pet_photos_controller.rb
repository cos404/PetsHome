class PetPhotosController < ApplicationController
  before_action :find_photo, only: [:destroy]

  def destroy
    @photo.destroy
  end

  def create
    @photo = PetPhoto.create!(title: params[:photo][:title], user_id: current_user.id, pet_id: params[:photo][:pet_id])
  end

  private

  def find_photo
    @photo = PetPhoto.find(params[:id])
  end
end
