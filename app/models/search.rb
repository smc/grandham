# frozen_string_literal: true

class Search
  attr_reader :query, :resource

  def initialize(resource, query)
    @query    = query
    @resource = resource
  end

  def results
    resource.search { fulltext query }.results
  end
end
