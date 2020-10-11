FactoryBot.define do
  factory :developer do
    name { Faker::Company.name }
  end
end
