class ShelterPhoto < ApplicationRecord

  belongs_to  :shelter

  validates :title, :user_id, :shelter_id, presence: true
  validates :user_id, :shelter_id, numericality: true

  mount_uploader :title, ShelterPhotoUploader

end
