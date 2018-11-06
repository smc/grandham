# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :publication do
    publisher_id { "" }
    book_id { 1 }
  end
end
