# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Test'
    last_name 'User'
    sequence(:email) { |n| "example_#{n}@example.com" }
    password 'changeme'
    password_confirmation 'changeme'
  end
end
