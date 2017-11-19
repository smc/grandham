# frozen_string_literal: true

class Admin::PublishersController < AdminController
  load_and_authorize_resource :publisher, find_by: :find_by_grandham_id

  respond_to :html

  before_action :find_publisher, except: %i[index new]

  def index
    @publishers = current_language.publishers

    respond_with @publishers
  end

  def edit; end

  def new
    @publisher = current_language.publishers.new
  end

  def create
    @publisher = current_language.publishers.new(params[:publisher])

    if @publisher.save
      redirect_to language_admin_publishers_path(current_language), notice: 'Publisher was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @publisher.update_attributes(params[:publisher])
      redirect_to language_admin_publishers_path(current_language), notice: 'Publisher was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private

  def find_publisher
    @publisher = current_language.publishers.find_by(grandham_id: params[:id])
  end
end
