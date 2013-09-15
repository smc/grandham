class LibrariesController < ApplicationController
  load_and_authorize_resource :library, :find_by => :find_by_grandham_id

  respond_to :html

  before_filter :find_library, only: [ :show, :update, :books ]

  def index
    collection = (current_language && current_language.libraries) || Library

    @libraries = collection.paginate(:page => params[:page], :per_page => 10)

    respond_with @libraries
  end

  def show
    @library = Library.find_by_grandham_id(params[:id])

    respond_with @library
  end

  def update
    respond_to do |format|
      book_id = (book = Book.find_by_grandham_id(params[:book_id])) ? book.id : nil
      record_edit @library, params[:library], book_id

      format.html { redirect_to language_library_path(@library.language, @library) }
      format.json { respond_with_bip(@library) }
    end
  end

  def books
    @books = @library.books.paginate(:page => params[:page], :per_page => 20)
  end

  private

  def find_library
    @library = Library.find_by_grandham_id(params[:id])
  end
end
