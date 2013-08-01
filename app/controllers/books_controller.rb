class BooksController < ApplicationController
  respond_to :html, :json

  before_filter :find_books_collection, only: [:index]

  def index
    respond_with @books
  end

  def show
    @book = Book.find_by_grandham_id(params[:id])
    respond_with @book
  end

  private

  def find_books_collection
    books_collection = current_language ? current_language.books.has_approved_submission : Book.has_approved_submission
    @books = books_collection.paginate(:page => params[:page], :per_page => 10)
  end
end
