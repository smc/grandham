class AuthorsController < ApplicationController
  respond_to :html

  def index
    @authors = Author.all

    respond_with @authors
  end

  def show
    @author = Author.find(params[:id])

    respond_with @author
  end
end
