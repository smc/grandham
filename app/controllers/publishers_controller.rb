class PublishersController < ApplicationController
  respond_to :html

  before_filter :find_publisher, only: [ :show, :update ]

  def index
    @publishers = Publisher.paginate(:page => params[:page], :per_page => 10)

    respond_with @publishers
  end

  def show
    @publisher = Publisher.find_by_grandham_id(params[:id])

    respond_with @publisher
  end

  def update
    respond_to do |format|
      book_id = (book = Book.find_by_grandham_id(params[:book_id])) ? book.id : nil
      record_edit @publisher, params[:publisher], book_id

      format.json { respond_with_bip(@publisher) }
    end
  end

  private

  def find_publisher
    @publisher = Publisher.find_by_grandham_id(params[:id])
  end
end
