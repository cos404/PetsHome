class ShelterPhotosController < ApplicationController
  before_action :find_photo, only: [:destroy]

  def destroy
    @shelter = @photo.shelter
    authorize @shelter
    return head :precondition_failed if @photo.title_identifier == @shelter.cover_identifier

    @photo.destroy
    render json: @photo, status: :ok
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    authorize @shelter

    @photo = ShelterPhoto.new(shelter_params)
    @photo.user_id = current_user.id
    @photo.shelter_id = params[:shelter_id]
    @photo.save
  end

  private

  def find_photo
    @photo = ShelterPhoto.find(params[:id])
  end

  def shelter_params
    params.require(:photo).permit(:title)
  end

end
