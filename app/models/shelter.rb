class Shelter < ApplicationRecord
  mount_uploader :cover, ShelterCoverUploader

  belongs_to  :user
  belongs_to  :country
  belongs_to  :city
  belongs_to  :region

  has_many    :pets, dependent: :destroy
  has_many    :shelter_comments, dependent: :destroy
  has_many    :shelter_photos, dependent: :destroy
  has_many    :shelter_staffs, dependent: :destroy
  has_many    :schedules, dependent: :destroy, autosave: true

  enum status: [:active, :suspended, :deactived]

  accepts_nested_attributes_for :schedules, reject_if: lambda{|attributes| attributes[:open].blank? || attributes[:close].blank?}, allow_destroy: true

  validates :user_id, numericality: true
  validates :user_id, :title, :street, :house_number, presence: true
  validates :country_id, :region_id, :city_id, presence: true
  validates :country_id, :region_id, :city_id, numericality: true

  geocoded_by :address
  after_validation :geocode

  def address
    if self.country && self.region && self.city
      country = self.country.title
      region  = self.region .title
      city    = self.city   .title
    end
    "#{country}, #{region}, #{city}, #{self.street} #{self.house_number}"
  end

end