# frozen_string_literal: true

class ApiBaseController < ApplicationController
  protected

  def parse_json_api_params
    @query = JsonApiQueryParser.new(params)
    @query.call
  end
end
