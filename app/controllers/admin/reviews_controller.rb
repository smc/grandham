class Admin::ReviewsController < AdminController

  before_filter :find_edit, except: [ :index ]

  def index
    @edits = current_language.edits
  end

  def approve
    object = @edit.editable

    object.update_attribute(@edit.field, @edit.new_value)

    redirect_to language_admin_reviews_path(current_language)
  end

  private

  def find_edit
    @edit = current_language.edits.find(params[:id])
  end
end