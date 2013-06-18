# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :datum do
    field_id 1
    value "MyString"
    submission_id 1
  end
end
