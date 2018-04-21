class Shelter < ApplicationRecord
  include PublicActivity::Model
  tracked only: [:create, :update], owner: Proc.new{|controller, model| controller.current_user}

  mount_uploader :cover, ShelterCoverUploader

  belongs_to  :user
  belongs_to  :country
  belongs_to  :city
  belongs_to  :region

  has_many    :pets, dependent: :destroy
  has_many    :shelter_photos, dependent: :destroy
  has_many    :shelter_staffs, dependent: :destroy
  has_many    :schedules, dependent: :destroy, autosave: true
  has_many    :phones, dependent: :destroy, autosave: true
  has_many    :comments, as: :commentable

  enum status: [:active, :suspended, :deactived]

  accepts_nested_attributes_for :schedules, reject_if: lambda{|attributes| attributes[:open].blank? || attributes[:close].blank?}, allow_destroy: true
  accepts_nested_attributes_for :phones, allow_destroy: true

  validates :user_id, numericality: true
  validates :user_id, :title, presence: true
  validates :country_id, :region_id, :city_id, presence: true
  validates :country_id, :region_id, :city_id, numericality: true

  geocoded_by :address, lookup: lambda{|obj| obj.geocoder_lookup}
  after_validation :geocode

  def address
    [house_number, street, city.title, region.title, country.title].compact.reject(&:empty?).join(', ')
  end

  def geocoder_lookup
    country.lookup_code.to_sym
  end

end