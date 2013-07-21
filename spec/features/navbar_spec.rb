require 'spec_helper'

describe "navbar" do
  describe "should contain proper links" do
    it "should have links without language short_code" do
      visit books_path

      expect(page).to have_selector "li a[href='#{books_path}']"
      expect(page).to have_selector "li a[href='#{authors_path}']"
      expect(page).to have_selector "li a[href='#{publishers_path}']"
    end

    it "should have links with language short_code" do
      language = FactoryGirl.create :language
      visit language_books_path(language_id: language.short_code)

      expect(page).to have_selector "li a[href='#{language_books_path(language)}']"
      expect(page).to have_selector "li a[href='#{language_authors_path(language)}']"
      expect(page).to have_selector "li a[href='#{language_publishers_path(language)}']"
    end
  end
end