FactoryBot.define do
  factory :delivery do
    id    {"1"}
    shipping_fee {"1"}

    association :product
    association :deliver_method
    association :estimated_date
    association :deliver_region
  end
end