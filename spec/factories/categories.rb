FactoryBot.define do

  factory :category do
    category {"テストカテゴリー1"}
    parent_id {"1"}
    size_type_id {"1"}
  end
end