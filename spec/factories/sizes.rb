FactoryBot.define do
  factory :size do
    size  {"XXS以下"}

    association :size_type
  end
end