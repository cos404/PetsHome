class Schedule < ApplicationRecord

  belongs_to  :shelter

  enum day_of_week: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  validates :shelter_id, numericality: true
  validates :shelter_id, presence: true
  validates_presence_of :close, :open,  if: :day_of_week?

end
