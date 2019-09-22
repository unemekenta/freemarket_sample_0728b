FactoryBot.define do
  factory :credit_card do
    id              {"2"}
    # 下記はテストカードに紐付いているid
    customer_id     {"cus_beff6d242078d942651d667a5de9"}
    card_id         {"car_8a5a9dee2c20198a5c14d2f300a2"}
  end
end