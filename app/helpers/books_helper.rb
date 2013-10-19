module BooksHelper
  def formatted_name(book)
    year = "(#{book.year})" unless book.year.blank?

    "#{book.title} #{year}"
  end

  def book_information(book, key, field)
    render partial: 'books/book_information', locals: { field: field, value: book.send(key) }
  end
end