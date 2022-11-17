# frozen_string_literal: true

FactoryBot.define do
  factory :waste_type do
    rule_day { create(:rule_day) }
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    instructions { Faker::Lorem.paragraph }
    irregular_frequency { Faker::Lorem.sentence }
    city_identifier { Faker::Number.number(digits: 2) }
  end
end
