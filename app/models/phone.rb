class Phone < ApplicationRecord
  belongs_to :shelter
  validates :name, presence: true
  validates :phone_number, uniqueness: {scope: :shelter_id}
  validates_plausible_phone :phone_number, presence: true
  phony_normalize :phone_number
end