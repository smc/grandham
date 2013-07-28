class PublishersController < ApplicationController
  def index
    @publishers = Publisher.all

    respond_to do |format|
      format.html
      format.json { render json: @publishers }
    end
  end

  def show
    @publisher = Publisher.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @publisher }
    end
  end
end