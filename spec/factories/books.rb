FactoryGirl.define do
  factory :book do
    language

    ignore do
      submissions_count 5
    end

    after(:create) do |book, evaluator|
      FactoryGirl.create_list(:submission, evaluator.submissions_count, book: book)
    end

    after(:create) do |book, evaluator|
      FactoryGirl.create(:approved_submission, book: book)
    end
  end
end
