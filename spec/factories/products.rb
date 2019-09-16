FactoryBot.define do
  factory :product do
    # id {"1"}
    name { "test" }
    price { "1000" }
    detail { "it is a test for product model" }

    association :condition
    association :status
    association :size
    association :category
    association :brand
    association :seller_id, factory: :user
  end
end
