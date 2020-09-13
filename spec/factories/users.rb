# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 5, max_length: 40) }
    bio { Faker::Books::Lovecraft.paragraph }
  end
end
