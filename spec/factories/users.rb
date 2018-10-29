# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :user do
    login { 'test_user_name' }
    password { 'test_password' }
    password_confirmation { 'test_password' }
    email { 'test@grandham.in' }
  end
end
