FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    family_name           { '山田' }
    fairst_name           { '太郎' }
    family_name_kana      { 'ヤマダ' }
    fairst_name_kana      { 'タロウ' }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end