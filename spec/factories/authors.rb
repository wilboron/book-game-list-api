# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    name { Faker::Book.author }
  end
end
