# frozen_string_literal: true

class PublishersController < ApplicationController
  load_and_authorize_resource :publisher, find_by: :grandham_id

  respond_to :html, :json

  before_action :find_publisher, only: %i[show update]

  def index
    collection = (current_language&.publishers) || Publisher

    @publishers = collection.paginate(page: params[:page], per_page: 10)

    respond_with @publishers
  end

  def show
    @publisher = Publisher.find_by(grandham_id: params[:id])

    respond_with @publisher
  end

  def update
    respond_to do |format|
      book_id = (book = Book.find_by(grandham_id: params[:book_id])) ? book.id : nil
      record_edit @publisher, params[:publisher], book_id

      format.html { redirect_to language_publisher_path(@publisher.language, @publisher) }
      format.json { respond_with_bip(@publisher) }
    end
  end

  def books
    @books = @publisher.books.paginate(page: params[:page], per_page: 20)
  end

  private

  def find_publisher
    @publisher = Publisher.find_by(grandham_id: params[:id])
  end
end
