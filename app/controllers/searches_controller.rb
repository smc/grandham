class SearchesController < ApplicationController
  before_filter :get_results

  def books
  end

  def authors
  end

  def publishers
  end

  def libraries
  end

  private

  def resource(action)
    resources = ['books', 'authors', 'libraries', 'publishers']

    if resources.include?(action)
      action.camelcase.singularize.constantize
    else
      redirect_to error_access_denied_path
    end
  end

  def get_results
    @results = Search.new(resource(params[:action]), params[:query]).results if params[:query]
  end
end
