class Admin::PublishersController < ApplicationController
  respond_to :html

  before_filter :find_publisher, except: [ :index, :new ]

  def index
    @publishers = current_language.publishers

    respond_with @publishers
  end

  def edit
  end

  def new
    @publisher = current_language.publishers.new
  end

  def create
    @publisher = current_language.publishers.new(params[:publisher])

    if @publisher.save
      redirect_to language_admin_publishers_path(current_language), notice: 'Publisher was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @publisher.update_attributes(params[:publisher])
      redirect_to language_admin_publishers_path(current_language), notice: 'Publisher was successfully updated.'
    else
      render action: "edit"
    end
  end

  private

  def find_publisher
    @publisher = current_language.publishers.find_by_grandham_id(params[:id])
  end
end