# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    user { create(:user) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    approved { false }
  end
end
