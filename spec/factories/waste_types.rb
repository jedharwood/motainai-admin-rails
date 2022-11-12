FactoryBot.define do
  factory :waste_type do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    instructions { Faker::Lorem.paragraph }
    irregular_frequency { Faker::Lorem.sentence }
    city_identifier { Faker::Number.number(digits: 2) }
  end
end
