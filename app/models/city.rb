class City < ApplicationRecord

  belongs_to  :region
  belongs_to  :country
  has_many    :shelter

  validates :region_id, :country_id, numericality: true
  validates :region_id, :country_id,  presence: true
  validates :title, presence: true

  validates_uniqueness_of :region_id, scope: :title
end
