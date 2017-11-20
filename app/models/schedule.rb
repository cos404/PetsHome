class Schedule < ApplicationRecord
  attr_accessor :work_day

  belongs_to  :shelter
  enum day_of_week: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
end
