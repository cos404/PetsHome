class Region < ApplicationRecord

  belongs_to :country

  has_many  :cities
  has_many  :shelter

  validates :country_id, numericality: true
  validates :country_id, :title_en, presence: true
  validates :title_en, :title_ru, :title_be, :title_fr, :title_de, :title_es, uniqueness: true

end
