FactoryBot.define do
  factory :product do
    id {"1"}
    name {"test"}
    price {"1000"}
    detail {"it is a test for product model"}
    seller_id {"1"}

    association :condition
    association :status
    association :category
    association :brand

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