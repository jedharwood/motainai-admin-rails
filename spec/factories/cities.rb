FactoryBot.define do
  factory :city do
    prefecture { create(:prefecture) }
    name { Faker::Address.city }
    rating { Faker::Number.within(range: 0.0..5.0) }
  end
end
