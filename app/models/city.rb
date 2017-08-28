class City < ApplicationRecord

  belongs_to  :country

  validates :eng,  presence: true
  validates :country_id, numericality: true

end
