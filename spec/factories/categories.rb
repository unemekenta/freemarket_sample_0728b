FactoryBot.define do

  factory :category do
    id    {"1"}
    category {"テストカテゴリー"}
    parent_id {"1"}

    association :size_type
  end
end