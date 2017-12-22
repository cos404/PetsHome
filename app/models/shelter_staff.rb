class ShelterStaff < ApplicationRecord

  belongs_to  :user
  belongs_to  :shelter
  belongs_to  :role

  validates :shelter_id, :user_id, presence: true
  validates :shelter_id, :user_id, numericality: true

  validates_uniqueness_of :shelter_id, scope: :user_id

end
