class Admin::BooksController < AdminController
  # load_and_authorize_resource :book, :find_by => :find_by_grandham_id

  respond_to :html, :json

  before_filter :find_book, only: [ :show, :update, :publish, :unpublish ]

  def index
    @books = current_language.books.unscoped
    respond_with @books
  end

  def show
    respond_with @book
  end

  def new
    @book = Book.unscoped.new
    @book.authors.build
    @book.publishers.build
    @book.covers.build
    @book.libraries.build
  end

  def publish
    @book.publish!
    redirect_to language_admin_books_path(current_language), notice: "'#{@book.title}' has been published."
  end

  def unpublish
    @book.unpublish!
    redirect_to language_admin_books_path(current_language), notice: "'#{@book.title}' has been unpublished."
  end

  def destroy
    @book = Book.find_by_grandham_id(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to language_admin_books_path(current_language), notice: 'Book was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def find_book
    @book = Book.unscoped.find_by_grandham_id(params[:id])
  end
end