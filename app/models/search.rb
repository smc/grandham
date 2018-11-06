# frozen_string_literal: true

class Search
  attr_reader :query, :resource, :page

  def initialize(resource, query, page)
    @query    = query
    @resource = resource
    @page = page
  end

  def results
    resource.search(query, page: page, per_page: 20)
  end
end
