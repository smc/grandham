class Admin::PublishersController < ApplicationController
  respond_to :html

  def index
    @publishers = current_language.publishers.paginate(:page => params[:page], :per_page => 20)

    respond_with @publishers
  end
end