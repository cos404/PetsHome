FactoryBot.define do
  factory :post do
    title "TITLE"
    body "TEXT"
    visibility true
    verified true
    user
  end
end
