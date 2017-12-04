FactoryBot.define do
  sequence :title do |n|
    "Title: #{n}"
  end
end

FactoryBot.define do
  factory :pet_photo do
    title
    user
    pet
  end
end
