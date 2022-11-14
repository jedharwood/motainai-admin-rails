# frozen_string_literal: true

FactoryBot.define do
  factory :prefecture do
    name { Faker::Address.state }
    code { Faker::Number.number(digits: 3) }
  end
end
