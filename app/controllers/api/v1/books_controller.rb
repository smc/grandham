# frozen_string_literal: true

class Api::V1::BooksController < ApiBaseController
  before_action :set_book, only: :show
  before_action :parse_json_api_params

  def show
    render json: BookSerializer.new(@book)
  end

  def index
    render json: BookSerializer.new(
      Book.paginate(page: @query.page_number, per_page: @query.per_page)
    )
  end

  private

  def set_book
    @book = Book.find_by!(grandham_id: params[:id])
  end
end
