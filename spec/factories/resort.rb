require 'faker'

FactoryBot.define do
  factory :resort do
    sequence(:name) { Faker::Name.name }
    sequence(:location) { Faker::Address.street_address }
    sequence(:price) { Faker::Number.between(from: 100, to: 1000) }
    sequence(:description) { Faker::Lorem.word }
    sequence(:guests_amount) { Faker::Number.between(from: 3, to: 20) }
    sequence(:image_url) { Faker::LoremFlickr.image }
    
    association :user
  end
end
