class BooksController < ApplicationController
  respond_to :html, :json

  def index
    @books = Book.all
    respond_with @books
  end

  def show
    @book = Book.find_by_grandham_id(params[:id])
    respond_with @book
  end

  def new
    @book = Book.new
    @book.authors.build
    @book.publishers.build
  end

  def create
    @book = Book.new(params[:book])
    @book.save
    redirect_to root_path
  end
end
