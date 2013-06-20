class FieldsController < ApplicationController
  respond_to :json

  def show
    @field = Field.find_by_short_id(params[:id])
    respond_with @field
  end
end
