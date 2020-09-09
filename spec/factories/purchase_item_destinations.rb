FactoryBot.define do
  factory :purchase_item_destination do
    post_code { '123-4567' }
    prefecture_id { 15 }
    city { '横浜市緑区' }
    address { '1-1' }
    building { '横浜ビル' }
    phone_number { 19_012_345_678 }
    price { 2000 }
    user_id { 7 }
    item_id { 14 }
    token { 'hoge_1234567' }
  end
end
