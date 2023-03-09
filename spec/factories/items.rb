FactoryBot.define do
  factory :item do
    name { 'Item' }
    image { Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'test.jpg'), 'image/jpeg') }
    description { ' item.' }
    price { Faker::Number.between(from: 300, to: 9999999).to_s }
    status_id { 2 }
    category_id { 2 }
    shipping_day_id { 2 }
    prefecture_id { 2 }
    seller_id { 2 }
    user
  end
end
