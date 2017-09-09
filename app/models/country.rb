class Country < ApplicationRecord

  has_many  :cities
  has_many  :regions
  has_many  :shelter

  validates :title_en,  presence: true
  validates :title_en, :title_ru, :title_be, :title_fr, :title_de, :title_es, uniqueness: true
end
