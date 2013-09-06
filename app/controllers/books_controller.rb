class BooksController < ApplicationController
  load_and_authorize_resource :book, :find_by => :find_by_grandham_id

  respond_to :html, :json

  before_filter :find_book, only: [ :show, :update ]

  def index
    @books = Book.paginate(:page => params[:page], :per_page => 10)
    respond_with @books
  end

  def show
    respond_with @book
  end

  def new
    @book = Book.new
    @book.authors.build
    @book.publishers.build
    @book.book_covers.build
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to root_path
    else
      @book.book_covers.build
      render "new"
    end
  end

  def update
    respond_to do |format|
      record_edit @book, params[:book]
      format.json { respond_with_bip(@book) }
    end
  end

  private

  def find_book
    @book = Book.find_by_grandham_id(params[:id])
  end
end
