# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Disable all json responses for now
  protect_from_forgery with: :exception, prepend: true
  before_action :disable_json
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery

  rescue_from CanCan::AccessDenied do |_exception|
    if user_signed_in?
      session[:access_denied_path] = request.url
      redirect_to error_access_denied_path
    else
      session[:redirect_url] = request.url
      redirect_to new_user_session_path, alert: alert_message
    end
  end

  before_action do |_controller|
    if user_signed_in? && (redirect_path = session.delete(:redirect_url))
      redirect_to redirect_path
    end
  end

  include EditHelper

  private

  def disable_json
    unless current_user&.is_an_admin?
      if request.format.to_s.include?('json')
        redirect_to error_access_denied_path
      end
    end
  end

  def after_sign_in_path_for(user)
    if user.is_an_admin?
      language_admin_dashboard_index_path(user.language)
    else
      super(user)
    end
  end

  def current_ability
    controller_name_segments = params[:controller].split('/')
    controller_name_segments.pop
    controller_namespace = controller_name_segments.join('/').camelize

    Ability.new(current_user, controller_namespace)
  end

  def alert_message
    if request.path == '/books/new'
      'Please sign in to add a new book'
    elsif request.path.match?(/.*\/books\/.*edit/)
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

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login])
  end
end
