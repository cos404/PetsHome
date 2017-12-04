FactoryBot.define do
  sequence :street do |n|
    "Street#{n}"
  end

  sequence :house_number do |n|
    "Number#{n}"
  end
end

FactoryBot.define do
  factory :shelter do
    about         'Better shelter in the world!'
    house_number
    street
    title         "New life"
    verified      true
    working       true
  end
end