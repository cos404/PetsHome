class City < ApplicationRecord

  belongs_to  :region
  has_many    :shelter

  validates :region_id, numericality: true
  validates :region_id,  presence: true
  validates :title_en, :title_ru, :title_be, :title_fr, :title_de, :title_es, presence: true

  validates_uniqueness_of :region_id, scope: :title_en
end
