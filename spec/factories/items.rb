FactoryBot.define do
  factory :item do
    name              {Faker::Name.initials(number: 2)}
    price             {300}
    item_condition_id { 2 }
    introduction      { '山田'}
    category_id       { 2 }
    shipping_cost_id  { 2 }
    prefecture_id     { 2 }
    shipping_day_id   { 2 }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec','image.jpg'), 'image/jpg') }
    user              { association :user }
  end
end
