# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    num_pages { Faker::Number.within(range: 50..600) }
    genre { Faker::Book.genre }
    serie { Faker::Books::Lovecraft.tome }
    pub_date { Faker::Date.between(from: 100.years.ago, to: Time.zone.today) }
    author
  end
end
