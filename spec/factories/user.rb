require 'faker'

FactoryBot.define do
  factory :user do
    name { 'Raihan' }
    email { Faker::Internet.unique.email }
    password { 'password' }
    role { 'admin' }
  end
end