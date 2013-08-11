class Admin::AuthorsController < ApplicationController
  respond_to :html

  before_filter :find_author, except: [ :index ]

  def index
    @authors = current_language.authors

    respond_with @authors
  end

  def edit
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
