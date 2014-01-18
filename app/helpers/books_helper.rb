module BooksHelper
  def book_cover_picture(book)
    if book.covers.empty?
      '/book_cover_missing.png'
    else
      book.covers.last.image.url(:thumb)
    end
  end

  def formatted_name(book)
    year = "(#{book.year})" unless book.year.blank?

    "#{book.title} #{year}"
  end

  def book_information(book, key, field)
    render partial: 'books/book_information', locals: { field: field, value: book.send(key) }
  end
end