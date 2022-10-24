FactoryBot.define do
  factory :city do
    prefecture { nil }
    name { Faker::Address.city }
    rating { Faker::Number.decimal(l_digits: 1, r_digits: 1) }
  end
end
