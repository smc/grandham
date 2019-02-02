# frozen_string_literal: true

class SearchesController < ApplicationController
  before_action :get_results

  def books; end

  def authors; end

  def publishers; end

  def libraries; end

  private

  def resource(action)
    resources = %w[books authors libraries publishers]

    if resources.include?(action)
      action.camelcase.singularize.constantize
    else
      redirect_to error_access_denied_path
    end
  end

  def get_results
    search_query = MalayalamTextNormalizer.new(params[:query]).call
    @results = Search.new(resource(params[:action]), search_query, params[:page]).results if params[:query].present?
  end
end
