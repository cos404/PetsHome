class City < ApplicationRecord

  belongs_to  :region
  has_many    :shelter

  validates :region_id, numericality: true
  validates :region_id,  presence: true
  validates :title, presence: true

  validates_uniqueness_of :region_id, scope: :title
end
