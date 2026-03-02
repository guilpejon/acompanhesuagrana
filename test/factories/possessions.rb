FactoryBot.define do
  factory :possession do
    association :user
    name { Faker::Commerce.product_name }
    possession_type { "vehicle" }
    purchase_price { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    current_value { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    purchase_date { Faker::Date.backward(days: 365) }
    currency { "BRL" }
    color { "#6C63FF" }
  end
end
