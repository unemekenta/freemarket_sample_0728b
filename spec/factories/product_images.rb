FactoryBot.define do 
  factory :product_image do
    # id {"1"}
    image {"test.jpg"}
    association :product
  end
end