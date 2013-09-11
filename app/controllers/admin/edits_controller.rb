class Admin::EditsController < AdminController
  load_and_authorize_resource :edit

  before_filter :find_edit, except: [ :index ]

  def index
    @edits = current_language.edits.not_reviewed
  end

  def approve
    object = @edit.editable

    object.update_attribute(@edit.field, @edit.new_value)
    @edit.update_attribute(:state, 'approved')

    redirect_to language_admin_edits_path(current_language)
  end

  def discard
    @edit.update_attribute(:state, 'discarded')

    redirect_to language_admin_edits_path(current_language)
  end

  def replace
    old_author = @edit.editable
    objects_collection = @edit.editable_type.downcase.pluralize

    @edit.book.send(objects_collection).delete(old_author)
    @edit.book.send(objects_collection) << Author.where(name: @edit.new_value, language_id: @edit.book.language.id ).first_or_create!

    @edit.update_attribute(:state, 'replaced')

    redirect_to language_admin_edits_path(current_language)
  end

  private

  def find_edit
    @edit = current_language.edits.find(params[:id])
  end
end