# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    title { Faker::Game.title }
    developer { Faker::Company.name }
    serie { Faker::Books::Lovecraft.deity }
    genre { Faker::Game.genre }
    pub_date { Faker::Date.between(from: 20.years.ago, to: Time.zone.today) }
  end
end
