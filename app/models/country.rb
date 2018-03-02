class Country < ApplicationRecord

  has_many  :cities
  has_many  :regions
  has_many  :shelter

  validates :title, presence: true
  validates :title, uniqueness: true
end
