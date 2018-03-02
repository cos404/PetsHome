class Region < ApplicationRecord

  belongs_to :country

  has_many  :cities
  has_many  :shelter

  validates :country_id, numericality: true
  validates :country_id, presence: true
  validates :title, presence: true
  validates_uniqueness_of :country_id, scope: :title
end
