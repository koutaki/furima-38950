FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           { '太郎' }
    fairst_name           { '山田' }
    family_name_kana      { 'タロウ' }
    fairst_name_kana      { 'ヤマダ' }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end