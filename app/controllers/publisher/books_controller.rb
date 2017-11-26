# frozen_string_literal: true

class Publisher::BooksController < PublisherController
  load_and_authorize_resource :book, find_by: :grandham_id

  def new
    @book = Book.unscoped.new
    @book.authors.build
    @book.publishers.build
    @book.covers.build
    @book.libraries.build
  end

  def create
    @book = Book.unscoped.new(book_params)

    @book.publishers << current_user.publisher

    if @book.save
      @book.new_items.create user_id: current_user.id, language_id: @book.language.id, state: 'approved'
      @book.approve!

      redirect_to language_book_path(@book.language, @book)
    else
      @book.covers.build
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:grandham_id, :language_id, :title, :isbn, :pages, :year, :description, :edition, :ddc, :volume, :series, :price, :length, :title_orginal, :illustrator, :note, :preface, :created_at, :updated_at, :approved, :published)
  end
end
