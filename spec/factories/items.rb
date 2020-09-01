FactoryBot.define do
  factory :item do
    name            { 'テスト' }
    explanation     { Faker::Lorem.sentence }
    price           { 5000 }
    category_id     { 2 }
    status_id       { 2 }
    delivery_fee_id { 2 }
    prefecture_id   { 2 }
    arrival_date_id { 2 }
    association :user
  end
end
