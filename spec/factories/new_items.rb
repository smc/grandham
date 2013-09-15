# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :new_item do
    reviewed_by_user_id ""
    status "MyString"
    user_id ""
    language_id ""
  end
end
