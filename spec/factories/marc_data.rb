# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :marc_datum do
    field "MyText"
    value "MyText"
    book_submission_id 1
  end
end
