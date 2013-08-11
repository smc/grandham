# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :language do
    name "English"
    sequence(:short_code) { |n| "en#{n}" }
  end
end