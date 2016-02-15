# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    login 'test_user_name'
    password 'test_password'
    password_confirmation 'test_password'
    email 'test@grandham.org'
  end
end
