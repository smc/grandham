# frozen_string_literal: true

class Admin::NewItemsController < AdminController
  load_and_authorize_resource :new_item

  before_action :find_new_item, except: [:index]

  def index
    @new_items = current_language.new_items.not_reviewed
  end

  def approve
    object = current_language.send(@new_item.creatable_type.downcase.pluralize).unscoped.find(@new_item.creatable_id)
    object.approve!

    @new_item.update state: 'approved', reviewed_by_user_id: current_user.id

    path = if current_language.new_items.not_reviewed.empty?
             language_admin_dashboard_index_path(current_language)
           else
             language_admin_new_items_path(current_language)
           end

    redirect_to path
  end

  def discard
    @new_item.update state: 'discarded', reviewed_by_user_id: current_user.id

    path = if current_language.new_items.not_reviewed.empty?
             language_admin_dashboard_index_path(current_language)
           else
             language_admin_new_items_path(current_language)
           end

    redirect_to path
  end

  private

  def find_new_item
    @new_item = current_language.new_items.not_reviewed.find(params[:id])
  end
end
