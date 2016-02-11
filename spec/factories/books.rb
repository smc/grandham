FactoryGirl.define do
  factory :book do
    language

    title 'Sample title'
    year '2013'
    pages '13'
    isbn '3333333333333'

    after(:create) do |book, evaluator|
      book.authors << FactoryGirl.create(:author, language_id: Language.default.id)
      book.publishers << FactoryGirl.create(:publisher, language_id: Language.default.id)
      book.covers.create
    end
  end
end
