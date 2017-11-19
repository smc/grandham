# frozen_string_literal: true

class Admin::LibrariesController < AdminController
  load_and_authorize_resource :library, find_by: :grandham_id

  respond_to :html

  before_action :find_library, except: %i[index new]

  def index
    @libraries = current_language.libraries

    respond_with @libraries
  end

  def edit; end

  def new
    @library = current_language.libraries.new
  end

  def create
    @library = current_language.libraries.new(library_params)

    if @library.save
      redirect_to language_admin_libraries_path(current_language), notice: 'Library was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @library.update_attributes(library_params)
      redirect_to language_admin_libraries_path(current_language), notice: 'Library was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private

  def library_params
    params.require(:library).permit(:name, :grandham_id, :language_id, :created_at, :updated_at, :place)
  end

  def find_library
    @library = current_language.libraries.find_by(grandham_id: params[:id])
  end
end
