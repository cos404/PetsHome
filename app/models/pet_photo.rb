class PetPhoto < ApplicationRecord

  mount_uploader :title, PetPhotoUploader

  belongs_to  :pet, optional: true
  belongs_to  :user

  validates :user_id, numericality: true
  validates :title, :user_id,  presence: true

end
