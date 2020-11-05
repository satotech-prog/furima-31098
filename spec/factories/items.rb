FactoryBot.define do
  factory :item do
    name {"sampleサンプル"}
    exposition {"sampleサンプル"}
    category_id {2}
    state_id {2}
    delivery_id {2}
    area_id {2}
    days_id {2}
    price {777}
    
    association :user
  end
end
