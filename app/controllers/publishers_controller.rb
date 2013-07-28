class PublishersController < ApplicationController
  respond_to :html

  def index
    @publishers = Publisher.all

    respond_with @publishers
  end

  def show
    @publisher = Publisher.find(params[:id])

    respond_with @publisher
  end
end