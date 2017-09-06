class City < ApplicationRecord

  belongs_to  :country

  validates :title_en,  presence: true
  validates :country_id, numericality: true
  validates :title_en, :title_ru, :title_be, :title_fr, :title_de, :title_es, uniqueness: true
end
