FactoryBot.define do

  factory :category do
    id    {"1"}
    category {"テストカテゴリー"}
    parent_id {"1"}
    size_type_id  {"1"}
  end
end