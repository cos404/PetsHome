class Country < ApplicationRecord

  has_many  :cities
  has_many  :regions

  validates :eng,  presence: true

end
