class AuthorsController < ApplicationController
  respond_to :html

  def index
    @authors = Author.paginate(:page => params[:page], :per_page => 10)

    respond_with @authors
  end

  def show
    @author = Author.find_by_grandham_id(params[:id])

    respond_with @author
  end
end
