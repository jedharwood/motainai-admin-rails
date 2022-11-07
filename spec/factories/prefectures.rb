FactoryBot.define do
  factory :prefecture do
    name { Faker::JpPrefecture::Prefecture.name }
    code { Faker::Number.number(digits: 3) }
  end
end
