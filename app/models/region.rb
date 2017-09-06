class Region < ApplicationRecord

  belngs_to :country

  has_many  :shelters
  has_many  :shelters, through: :shelter_regions

  validates :country_id, numericality: true
  validates :country_id, :eng, presence: true
  validates :title_en, :title_ru, :title_be, :title_fr, :title_de, :title_es, uniqueness: true

end
