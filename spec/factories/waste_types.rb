FactoryBot.define do
  factory :waste_type do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    instructions { Faker::Lorem.paragraph }
    irregular_frequency { Faker::Lorem.sentence }
  end
end
