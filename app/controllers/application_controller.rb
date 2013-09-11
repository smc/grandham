class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to '/403'
    else
      session[:redirect_url] = request.url
      redirect_to new_user_session_path, :alert => alert_message
    end
  end

  before_filter do |controller|
    if user_signed_in? && (redirect_path = session.delete(:redirect_url))
      redirect_to redirect_path
    end
  end

  include EditHelper

  private

  def current_ability
    controller_name_segments = params[:controller].split('/')
    controller_name_segments.pop
    controller_namespace = controller_name_segments.join('/').camelize

    Ability.new(current_user, controller_namespace)
  end

  def alert_message
    if request.path == '/books/new'
      "Please sign in to add a new book"
    elsif request.path =~ /.*\/books\/.*edit/
      "Please sign in to edit the book '#{current_book.title}'"
    end
  end

  def current_language
    Language.where('short_code = ?', params[:language_id]).first
  end
  helper_method :current_language

  def current_book
    Book.where('grandham_id = ?', params[:id]).first
  end
  helper_method :current_book
end