class Pet < ApplicationRecord

  belongs_to  :shelter
  belongs_to  :user

  has_many    :pet_photos

  validates :shelter_id, :user_id, :type, :size, :color, presence: true
  validates :shelter_id, :user_id, numericality: true
  validates_presence_of :euthanasia_date, if: :euthanasia?

end
