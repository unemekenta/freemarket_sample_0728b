FactoryBot.define do
  
  factory :deliveraddress do
    family_name                 {Faker::Name.last_name}
    first_name                  {Faker::Name.first_name}
    family_name_pseudonym       {Faker::Japanese::Name.last_name.yomi}
    first_name_pseudonym        {Faker::Japanese::Name.first_name.yomi}
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