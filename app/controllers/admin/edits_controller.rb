class Admin::EditsController < AdminController
  load_and_authorize_resource :edit

  before_filter :find_edit, except: [ :index ]

  def index
    @edits = current_language.edits.not_reviewed
  end

  def approve
    object = @edit.editable

    object.update_attribute(@edit.field, @edit.new_value)
    @edit.update_attributes state: 'approved', reviewed_by_user_id: current_user.id

    if current_language.edits.not_reviewed.empty?
      path = language_admin_dashboard_index_path(current_language)
    else
      path = language_admin_edits_path(current_language)
    end

    redirect_to path
  end

  def discard
    @edit.update_attributes state: 'discarded', reviewed_by_user_id: current_user.id

    if current_language.edits.not_reviewed.empty?
      path = language_admin_dashboard_index_path(current_language)
    else
      path = language_admin_edits_path(current_language)
    end

    redirect_to path
  end

  def replace
    old_object = @edit.editable
    old_object_class = old_object.class
    objects_collection = @edit.editable_type.downcase.pluralize

    @edit.book.send(objects_collection).delete(old_object)
    @edit.book.send(objects_collection) << old_object_class.where(name: @edit.new_value, language_id: @edit.book.language.id ).first_or_create!

    @edit.update_attributes state: 'replaced', reviewed_by_user_id: current_user.id

    redirect_to language_admin_edits_path(current_language)
  end

  private

  def find_edit
    @edit = current_language.edits.find(params[:id])
  end
end