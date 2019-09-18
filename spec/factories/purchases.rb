FactoryBot.define do
  factory :purchase do
    product  {FactoryBot.create :product, :skip_validate}
    association :seller, factory: :user, email: "seller@email.ne.jp"
    association :buyer, factory: :user, email: "buyer@email.ne.jp"
  end
end