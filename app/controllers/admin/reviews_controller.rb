class Admin::ReviewsController < AdminController

  before_filter :find_edit, except: [ :index ]

  def index
    @edits = current_language.edits.not_reviewed
  end

  def approve
    object = @edit.editable

    object.update_attribute(@edit.field, @edit.new_value)
    @edit.update_attribute(:state, 'approved')

    redirect_to language_admin_reviews_path(current_language)
  end

  def discard
    @edit.update_attribute(:state, 'discarded')

    redirect_to language_admin_reviews_path(current_language)
  end

  private

  def find_edit
    @edit = current_language.edits.find(params[:id])
  end
end