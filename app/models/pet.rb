class Pet < ApplicationRecord

  mount_uploader :avatar, PetAvatarUploader

  belongs_to  :shelter
  belongs_to  :user

  has_many    :pet_comments
  has_many    :pet_photos

  before_validation :enum_to_int

  validates :shelter_id, :user_id, :subspecies, :size, :color, presence: true
  validates :shelter_id, :user_id, :subspecies, numericality: true
  validates_presence_of :euthanasia_date, if: :euthanasia?

  enum subspecies: [:dog, :cat, :another]
  enum gender: [:boy, :girl]
  enum size: [:s, :m, :l]

  private

  def enum_to_int
    self.subspecies = Pet.subspecies[self.subspecies]
    self.gender     = Pet.genders[self.gender]
    self.size       = Pet.sizes[self.size]
  end

end
