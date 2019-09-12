FactoryBot.define do
  
  factory :deliveraddress do
    family_name                 {"山田"}
    first_name                  {"太郎"}
    family_name_pseudonym       {"ヤマダ"}
    first_name_pseudonym        {"タロウ"}
    post_number                 {"123-4567"}
    prefecture                  {"北海道"}
    city                        {"横浜市緑区"}
    street                      {"青山1-1-1"}
    building                    {"柳ビル"}
    phone_number                {"09012345678"}
    user_id                     {"1"}
    id                          {"1"}
    created_at                  {"2019-09-09"}
    updated_at                  {"2019-09-09"}
  end
end