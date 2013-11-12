# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'lglavin'
    phone_number '5088133898'
    email 'zombie@example.com'
    #time_zone 'Eastern Time'
    password '12345678'
    password_confirmation '12345678'
  end
end
