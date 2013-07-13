class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_language
    Language.where('short_code = ?', params[:language_id]).first
  end
  helper_method :current_language

  def current_book
    Book.where('grandham_id = ?', params[:book_id]).first
  end
  helper_method :current_book
end