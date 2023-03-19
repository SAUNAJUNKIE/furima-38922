FactoryBot.define do
  factory :order_shipping_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone { '0123456789' }
    token {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item

  end
end
