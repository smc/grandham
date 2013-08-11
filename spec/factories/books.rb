FactoryGirl.define do
  factory :book do
    language

    title 'Sample title'
    year '2013'
    pages '13'

    after(:create) do |book, evaluator|
      book.authors << FactoryGirl.create(:author, language_id: Language.default.id)
      book.publishers << FactoryGirl.create(:publisher, language_id: Language.default.id)
    end
  end
end
