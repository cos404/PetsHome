class PetComment < ApplicationRecord

  belongs_to  :user
  belongs_to  :pet

  validates :user_id, :pet_id, :body,  presence: true
  validates :user_id, :pet_id, numericality: true

end
