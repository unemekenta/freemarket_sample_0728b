FactoryBot.define do
  factory :product do
    name { "test" }
    price { "1000" }
    detail { "it is a test for product model" }

    association :condition
    association :status
    association :size
    association :category
    association :brand
    association :seller_id, factory: :user
    
    trait :skip_validate do
      factory :product do
        id {"2"}
        name {"test"}
        price {"1000"}
        detail {"testtest"}
      end
      to_create { |instance| instance.save(validate: false)}
    end
  end
end
