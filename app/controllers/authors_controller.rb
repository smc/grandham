class AuthorsController < ApplicationController

  def index
    @authors = Author.all

    respond_to do |format|
      format.html
      format.json { render json: @authors }
    end
  end

  def show
    @author = Author.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @author }
    end
  end
end
