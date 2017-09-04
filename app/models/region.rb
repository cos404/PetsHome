class Region < ApplicationRecord

  belngs_to :country
  has_many  :region, through: :shelter_regions

  validates :country_id, numericality: true
  validates :country_id, :eng, presence: true
  validates :eng, :rus, :bel, :fr, :de, :es, uniqueness: true

end
