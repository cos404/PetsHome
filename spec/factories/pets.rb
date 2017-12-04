FactoryBot.define do
  sequence :name do |n|
    "Name#{n}"
  end
end

FactoryBot.define do
  factory :pet do
    subspecies :dog
    birthday '2012/03/29'
    name
    euthanasia false
    size 1
    gender 0
    vaccination true
    diseases "None"
    sterilization true
    color "Green"
    about "My Little Doggy"
    user
    shelter
    finished true
    finished_description "He found new family"
  end
end