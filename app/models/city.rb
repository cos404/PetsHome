class City < ApplicationRecord

  belongs_to  :region
  has_many    :shelter

  validates :title_en,  presence: true
  validates :region_id, numericality: true
  validates :title_en, :title_ru, :title_be, :title_fr, :title_de, :title_es, uniqueness: true
end
