FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "plan_#{i}@fromouterspace.com" }
    password { 'password' }
  end
end
