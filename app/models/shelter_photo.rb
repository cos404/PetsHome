class ShelterPhoto < ApplicationRecord

  mount_uploader :title, ShelterPhotoUploader

  belongs_to  :shelter, optional: true
  belongs_to  :user

  validates :user_id, numericality: true
  validates :title, :user_id,  presence: true

end
