# frozen_string_literal: true

class ApiBaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |_exception|
    head :not_found
  end

  protected

  def parse_json_api_params
    @query = JsonApiQueryParser.new(params)
    @query.call
  end
end
