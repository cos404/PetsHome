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

  accepts_nested_attributes_for :schedules, reject_if: lambda{|a| a[:work_day].to_i.zero?}, allow_destroy: true

  validates :user_id, :country_id, :region_id, :city_id, numericality: true
  validates :user_id, :title, :street, :house_number, :country_id, :city_id,  presence: true

  geocoded_by :shelter_address
  after_validation :geocode

  private

    def shelter_address

      country = self.country.send("title_#{I18n.locale}")
      region  = self.region .send("title_#{I18n.locale}")
      city    = self.city   .send("title_#{I18n.locale}")

      puts "#{country}, #{region}, #{city}, #{self.street} #{self.house_number}"
      "#{country}, #{region}, #{city}, #{self.street} #{self.house_number}"
    end

end