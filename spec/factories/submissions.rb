# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :submission do
    book_id 1
    approved false
    title 'ABCDEFG'
    year '2013'
    pages '13'
  end
end
