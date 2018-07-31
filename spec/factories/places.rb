FactoryBot.define do
  factory :place do
    name Faker::Restaurant.name
    address Faker::Address.street_address
    menu_url Faker::Internet.url
  end
end
