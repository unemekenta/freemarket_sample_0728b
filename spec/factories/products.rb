
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
  end
end