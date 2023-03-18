FactoryBot.define do
  factory :item do
    name { 'Item' }
    description { ' item.' }
    price { Faker::Number.between(from: 300, to: 9999999).to_s }
    status_id { 2 }
    category_id { 2 }
    shipping_day_id { 2 }
    prefecture_id { 2 }
    seller_id { 2 }
    user


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
