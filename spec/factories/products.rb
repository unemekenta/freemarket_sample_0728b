FactoryBot.define do
  
  factory :product do
    id                   {"1"}
    name                 {"サンプル商品"}
    price                {"3333"}
    detail               {"サンプル説明"}
    status_id            {"1"}
    condition_id         {"1"}
    brand_id             {"1"}
    category_id          {"777"}
    size_id              {"1"}
    seller_id            {"1"}
    created_at           {"2019-09-09"}
    updated_at           {"2019-09-09"}

    after(:create) do |product|
      product.product_image << FactoryBot.create(:product_image, image:"テスト.png")
    end
  end
end