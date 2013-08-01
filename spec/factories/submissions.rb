# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :submission do
    book_id 1
    approved false
    title 'ABCDEFG'
    year '2013'
    pages '13'

    factory :approved_submission do
      approved true
    end

    after(:create) do |submission, evaluator|
      submission.authors << FactoryGirl.create(:author, language_id: Language.default.id)
    end

    after(:create) do |submission, evaluator|
      submission.publishers << FactoryGirl.create(:publisher, language_id: Language.default.id)
    end
  end
end
