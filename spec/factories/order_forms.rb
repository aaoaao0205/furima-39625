FactoryBot.define do
  factory :order_form do
    user_id {1}
    item_id {1}
    postal_code { "#{rand(100..999)}-#{rand(1000..9999)}" }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { "建物名#{rand(100)}" }
    phone_number { Faker::PhoneNumber.subscriber_number(length: 10) } 
  end
end
