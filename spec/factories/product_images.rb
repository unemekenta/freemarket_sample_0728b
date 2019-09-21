FactoryBot.define do 
  factory :product_image do

    id {"1"}
    image {File.open("#{Rails.root}/spec/fixtures/lake.jpg")}
    product_id {"1"}
    created_at {"2019-09-15"}
    updated_at {"2019-09-15"}
  end
end