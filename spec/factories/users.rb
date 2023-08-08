FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    kana_last_name        {"ヤマダ"}
    kana_first_name       {"タロウ"}
    birthday              {Faker::Date.birthday}
  end
end