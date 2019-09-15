FactoryBot.define do 
  factory :product_image do
    id {"1"}
    image {"test.jpg"}

    association :product
    product {product_image.product}
  end
end