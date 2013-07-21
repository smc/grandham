require 'spec_helper'

describe "Books" do
  before (:all) do
    @book = FactoryGirl.create :book
  end

  context "Books list" do
    it "shows me link to each book's page"  do
      visit root_path
      expect(page).to have_selector "h3 a[href='#{language_book_path(@book.language, @book)}']"
    end
  end

  context "Book's individual page'" do
    it "takes me to book's page" do
      visit language_book_path(@book.language, @book)

      expect(page).to have_content @book.approved_submission.title
    end
  end
end