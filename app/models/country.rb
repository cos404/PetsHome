class Country < ApplicationRecord

  has_many  :cities
  has_many  :regions

  validates :eng,  presence: true
  validates :eng, :rus, :bel, :fr, :de, :es, uniqueness: true
end
