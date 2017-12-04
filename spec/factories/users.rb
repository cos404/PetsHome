FactoryBot.define do
  sequence :email do |n|
    "user#{n}@site.com"
  end

  sequence :fullname do |n|
    "User#{n}"
  end

  sequence :username do |n|
    "Name#{n}"
  end
end

FactoryBot.define do
  factory :user do
    email
    password 'qwerty'
    password_confirmation 'qwerty'
    confirmed_at Time.now
    email_visible true
    fullname
    username
  end
end