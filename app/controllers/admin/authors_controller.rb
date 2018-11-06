# frozen_string_literal: true

class Admin::AuthorsController < AdminController
  load_and_authorize_resource :author, find_by: :grandham_id

  respond_to :html

  before_action :find_author, except: %i[index new]

  def index
    @authors = current_language.authors

    respond_with @authors
  end

  def edit; end

  def new
    @author = current_language.authors.new
  end

  def create
    @author = current_language.authors.new(author_params)

    if @author.save
      redirect_to language_admin_authors_path(current_language), notice: "Author was successfully created."
    else
      render action: "new"
    end
  end

  def update
    if @author.update(author_params)
      redirect_to language_admin_authors_path(current_language), notice: "Author was successfully updated."
    else
      render action: "edit"
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :created_at, :updated_at, :language_id, :grandham_id)
  end

  def find_author
    @author = current_language.authors.find_by(grandham_id: params[:id])
  end
end
