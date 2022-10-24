FactoryBot.define do
  factory :profile do
    user { nil }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    approved { false }
  end
end
