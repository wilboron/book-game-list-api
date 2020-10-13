# frozen_string_literal: true

FactoryBot.define do
  factory :read do
    did_not_finished { false }
    medium { 1 }
    start_date { Faker::Date.between(from: 1.year.ago, to: Time.zone.today) }
    end_date { Faker::Date.between(from: Time.zone.today, to: 2.years.from_now) }
    book
    user
  end
end
