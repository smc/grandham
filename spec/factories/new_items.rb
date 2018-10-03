# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :new_item do
    reviewed_by_user_id { '' }
    status { 'MyString' }
    user_id { '' }
    language_id { '' }
  end
end
