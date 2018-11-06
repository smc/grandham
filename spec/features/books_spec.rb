# frozen_string_literal: true

require "spec_helper"

describe "Books" do
  before (:all) do
    @book = FactoryBot.create :book
  end

  context "Book's individual page'" do
    it "takes me to book's page" do
      visit language_book_path(@book.language, @book)

      expect(page).to have_content @book.title
    end
  end
end
