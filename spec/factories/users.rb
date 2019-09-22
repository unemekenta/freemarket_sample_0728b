FactoryBot.define do
  factory :user do
    # password = Faker::Internet.password(8)
    nickname                    {"K"}
    birthday                    {"1998-04-01"}
    family_name                 {"山田"}
    first_name                  {"太郎"}
    family_name_pseudonym       {"ヤマダ"}
    first_name_pseudonym        {"タロウ"}
    email                       {Faker::Internet.free_email}
    password                    {password}
    password_confirmation       {password}
  end
end
