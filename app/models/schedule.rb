class Schedule < ApplicationRecord
  belongs_to  :shelter
  enum day_of_week: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
end
