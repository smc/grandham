class Admin::AuthorsController < ApplicationController
  respond_to :html

  before_filter :find_author, except: [ :index, :new ]

  def index
    @authors = current_language.authors

    respond_with @authors
  end

  def edit
  end

  def new
    @author = current_language.authors.new
  end

  def create
    @author = current_language.authors.new(params[:author])

    if @author.save
      redirect_to language_admin_authors_path(current_language), notice: 'Author was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @author.update_attributes(params[:author])
      redirect_to language_admin_authors_path(current_language), notice: 'Author was successfully updated.'
    else
      render action: "edit"
    end
  end

  private

  def find_author
    @author = current_language.authors.find_by_grandham_id(params[:id])
  end
end
