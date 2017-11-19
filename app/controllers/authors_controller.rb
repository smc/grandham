# frozen_string_literal: true

class AuthorsController < ApplicationController
  load_and_authorize_resource :author, find_by: :find_by_grandham_id

  respond_to :html, :json

  before_action :find_author, only: %i[show update]

  def index
    collection = (current_language&.authors) || Author

    @authors = collection.paginate(page: params[:page], per_page: 10)
    respond_with @authors
  end

  def show
    respond_with @author
  end

  def update
    respond_to do |format|
      book_id = (book = Book.find_by(grandham_id: params[:book_id])) ? book.id : nil
      record_edit @author, params[:author], book_id

      format.html { redirect_to language_author_path(@author.language, @author) }
      format.json { respond_with_bip(@author) }
    end
  end

  def books
    @books = @author.books.paginate(page: params[:page], per_page: 20)
  end

  private

  def find_author
    @author = Author.find_by(grandham_id: params[:id])
  end
end
