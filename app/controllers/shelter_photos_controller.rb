class ShelterPhotosController < ApplicationController
  before_action :find_photo, only: [:destroy]

  def destroy
    @photo.destroy
  end

  def create
    @photo = ShelterPhoto.create!(title: params[:photo][:title], user_id: current_user.id, shelter_id: params[:photo][:shelter_id])
  end

  private

  def find_photo
    @photo = ShelterPhoto.find(params[:id])
  end
end
