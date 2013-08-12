class AuthorsController < ApplicationController
  respond_to :html

  before_filter :find_author, only: [ :show, :update ]

  def index
    @authors = Author.paginate(:page => params[:page], :per_page => 10)

    respond_with @authors
  end

  def show
    respond_with @author
  end

  def update
    respond_to do |format|
      record_edit @author, params[:author]
      format.json { respond_with_bip(@author) }
    end
  end

  private

  def find_author
    @author = Author.find_by_grandham_id(params[:id])
  end
end
