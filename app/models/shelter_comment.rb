class ShelterComment < ApplicationRecord

  belongs_to  :user
  belongs_to  :shelter

  validates :user_id, :shelter_id, :body,  presence: true
  validates :user_id, :shelter_id, numericality: true

end
