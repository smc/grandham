module BooksHelper
  def formatted_name(book)
    year = "(#{book.year})" unless book.year.blank?

    "#{book.title} #{year}"
  end
end
