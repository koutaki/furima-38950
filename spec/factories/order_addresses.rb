FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_number { '1' }
    building_name { 'A棟' }
    phone_number { '00000000000' }
    token {000}
  end
end
