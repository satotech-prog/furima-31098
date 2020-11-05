FactoryBot.define do
  factory :item do
    name { 'sampleサンプル' }
    exposition { 'sampleサンプル' }
    category_id { 2 }
    state_id { 2 }
    delivery_id { 2 }
    area_id { 2 }
    days_id { 2 }
    price { 777 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
