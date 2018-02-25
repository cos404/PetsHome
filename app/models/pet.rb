class Pet < ApplicationRecord

  mount_uploader :avatar, PetAvatarUploader

  belongs_to  :shelter
  belongs_to  :user

  has_many    :pet_comments
  has_many    :pet_photos

  before_validation :enum_to_int

  validates :shelter_id, :user_id, :subspecies, :size, :color, :gender, presence: true
  validates :shelter_id, :user_id, :subspecies, numericality: true

  enum subspecies: [:dog, :cat, :other]
  enum gender: [:boy, :girl]
  enum size: [:s, :m, :l]
  enum status: [:active, :euthanized, :took, :deactived]

  private

  def enum_to_int
    self.subspecies = Pet.subspecies[self.subspecies]
    self.gender     = Pet.genders[self.gender]
    self.size       = Pet.sizes[self.size]
    self.status     = Pet.statuses[self.status]
  end

end
