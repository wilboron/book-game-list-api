# frozen_string_literal: true

FactoryBot.define do
  factory :play do
    did_not_finished { false }
    minutes_played { Faker::Number.within(range: 50..4000) }
    plataform { 1 }
    start_date { Faker::Date.between(from: 1.year.ago, to: Time.zone.today) }
    end_date { Faker::Date.between(from: Time.zone.today, to: 2.years.from_now) }
    game
    user
  end
end
