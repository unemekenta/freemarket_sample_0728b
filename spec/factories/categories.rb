FactoryBot.define do
  factory :category do
    category {"テストカテゴリー"}
    parent_id {"1"}
    association :size_type
  end
end