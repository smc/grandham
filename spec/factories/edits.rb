# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :edit do
    editable_id { 1 }
    editable_type { "" }
    klass { "MyString" }
    field { "MyString" }
    old_value { "MyText" }
    new_value { "MyText" }
    user_id { 1 }
    approved { false }
    status { "MyString" }
    reviewed_by_user_id { 1 }
  end
end
