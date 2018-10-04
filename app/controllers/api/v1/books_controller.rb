# frozen_string_literal: true

class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: :show
  def show
    render json: BookSerializer.new(@book)
  end

  def index
    render json: BookSerialiizer.new(Book.all)
  end

  private

  def set_book
    @book = Book.find_by(grandham_id: params[:id])
  end
end
