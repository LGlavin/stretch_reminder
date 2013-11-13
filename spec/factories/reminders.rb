# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reminder do
    description "MyString"
    user_id 1
     datetime 'monday'
  end
end
