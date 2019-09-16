FactoryBot.define do 
  factory :product_image do
    image {"test.jpg"}
    association :product
  end
end