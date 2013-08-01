class PublishersController < ApplicationController
  respond_to :html

  def index
    @publishers = Publisher.paginate(:page => params[:page], :per_page => 10)

    respond_with @publishers
  end

  def show
    @publisher = Publisher.find_by_grandham_id(params[:id])

    respond_with @publisher
  end
end