# frozen_string_literal: true

FactoryBot.define do
  factory :rule_day do
    city { nil }
    code { Faker::Number.number(digits: 1) }
    name { Faker::Lorem.word }
  end
end
