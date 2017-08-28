class PetPhoto < ApplicationRecord

  belongs_to  :pet

  validates :user_id, :pet_id, :title, presence: true
  validates :user_id, :pet_id, numericality: true

end
