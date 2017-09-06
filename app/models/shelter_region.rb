class ShelterRegion < ApplicationRecord

  belongs_to  :region

  has_many    :shelters

  validates :shelter_id, :region_id, presence: true
  validates :shelter_id, :region_id, numericality: true

end
