class PetPhoto < ApplicationRecord

  belongs_to  :pet
  belongs_to  :user

  validates :user_id, :pet_id, numericality: true

  mount_uploader :title, PetPhotoUploader

end
