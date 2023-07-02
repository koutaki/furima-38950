FactoryBot.define do
  factory :order do
    user_id {1}
    item_id {1}
    token {"tok_abcdefghijk00000000000000000"}
  end
end