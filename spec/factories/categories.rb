# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Test category #{n}" }
    icon_class 'test-icon'
  end
end
