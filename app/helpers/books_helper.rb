module BooksHelper
  def formatted_name(book)
    year = "(#{book.year})" unless book.year.empty?

    "#{book.title} #{year}"
  end
end
