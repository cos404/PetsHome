class City < ApplicationRecord

  belongs_to  :country

  validates :eng,  presence: true
  validates :country_id, numericality: true
  validates :eng, :rus, :bel, :fr, :de, :es, uniqueness: true
end
