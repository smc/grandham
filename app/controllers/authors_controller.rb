class AuthorsController < ApplicationController
  load_and_authorize_resource :author, :find_by => :find_by_grandham_id

  respond_to :html

  before_filter :find_author, only: [ :show, :update ]

  def index
    @authors = Author.paginate(:page => params[:page], :per_page => 10)

    respond_with @authors
  end

  def show
    respond_with @author
  end

  def update
    respond_to do |format|
      book_id = (book = Book.find_by_grandham_id(params[:book_id])) ? book.id : nil
      record_edit @author, params[:author], book_id

      format.json { respond_with_bip(@author) }
    end
  end

  private

  def find_author
    @author = Author.find_by_grandham_id(params[:id])
  end
end
