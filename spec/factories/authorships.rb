# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :authorship do
    author_id { 1 }
    book_id { 1 }
  end
end
