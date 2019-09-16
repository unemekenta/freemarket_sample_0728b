FactoryBot.define do
  factory :user do
    # id                          {"1"}
    nickname                    {"K"}
    birthday                    {"1998-04-01"}
    family_name                 {"山田"}
    first_name                  {"太郎"}
    family_name_pseudonym       {"ヤマダ"}
    first_name_pseudonym        {"タロウ"}
    email                       {"test@user"}
    password                    {"000000"}
    password_confirmation       {"000000"}
  end
end
