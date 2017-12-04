FactoryBot.define do
  factory :pet_comment do
    body "COMMENT"
    pet
    user
  end
end
