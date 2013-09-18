class Publisher::BooksController < PublisherController
  load_and_authorize_resource :book, :find_by => :find_by_grandham_id

  def new
    @book = Book.unscoped.new
    @book.authors.build
    @book.publishers.build
    @book.covers.build
    @book.libraries.build
  end

  def create
    @book = Book.unscoped.new(params[:book])

    @book.publishers << current_user.publisher

    if @book.save
      @book.new_items.create user_id: current_user.id, language_id: @book.language.id, state: 'approved'
      @book.approve!

      redirect_to language_book_path(@book.language, @book)
    else
      @book.covers.build
      render "new"
    end
  end
end