class SearchesController < ApplicationController
  def show
    @results = Search.new(params[:query]).results
  end
end
