# frozen_string_literal: true

FactoryBot.define do
  factory :payment do
    user_id { 1 }
    amount { 50.5 }
    currency { "usd" }
  end
end
