# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :language do
    name { "English" }
    sequence(:short_code) { |n| "en#{n}" }
  end
end
