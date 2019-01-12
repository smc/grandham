# frozen_string_literal: true

class JsonApiQueryParser
  attr_reader :page_number, :per_page
  def initialize(params, options = nil)
    @params = params.is_a?(Hash) ? params : params.permit(page: %i[number size]).to_h
    @options = options
  end

  def call
    @page_number = params.dig('page', 'number') || 1
    @per_page = params.dig('page', 'size') || 20
  end

  private

  attr_reader :params, :options
end
