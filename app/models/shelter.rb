class Shelter < ApplicationRecord

  belongs_to  :user
  belongs_to  :country
  belongs_to  :city
  belongs_to  :region

  has_many    :pets
  has_many    :shelter_photos
  has_many    :shelter_staffs
  has_many    :schedules

  validates :user_id, :country_id, :region_id, :city_id, numericality: true
  validates :user_id, :title, :street, :house_number, :country_id, :city_id,  presence: true
end
