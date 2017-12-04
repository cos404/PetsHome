FactoryBot.define do
  factory :schedule do
    day_of_week [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday].sample
    open  "2017-12-04 08:39:00"
    close "2017-12-04 21:39:00"
    shelter
  end
end
