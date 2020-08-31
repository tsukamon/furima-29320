FactoryBot.define do
  factory :user do
    nickname { '山ちゃん' }
    email { Faker::Internet.free_email }
    password { 'sample1' }
    password_confirmation { password }
    family_name { '山田' }
    first_name { '太郎' }
    family_name_katakana { 'ヤマダ' }
    first_name_katakana { 'タロウ' }
    birthday { '1991-08-07' }
  end
end
