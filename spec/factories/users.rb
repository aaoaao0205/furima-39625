FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { Faker::Name.name }
    first_name            { Faker::Name.name }
    kana_last_name        { 'ヤマダ' }
    kana_first_name       { 'タロウ' }
    birthday              { Faker::Date.birthday }
  end
end
