class Search

  RESOURCES = [ Book ]

  attr_reader :query

  private

  def search_with_plugin(resource)
    SolrSearch.new(resource, self).results
  end

  public

  def initialize(query)
    @query = query
  end

  def to_hash
    sanitize Hash[@query.strip.split(';').collect{ |segment| segment.split(':') }]
  end

  def sanitize(hash)
    {}.tap { |h| hash.each { |key, val| h[key.strip] = val.strip } }
  end

  def query_is_specific?
    @query =~ /\S*:.*\S+;/
  end

  def search_term_for(resource)
    query_is_specific? ? to_hash[resource.to_s.downcase] : @query
  end

  def results
    return {} if @query.blank?
    RESOURCES.inject({}) do |result_hash, resource|
      result_hash.merge!({ resource.to_s.downcase => search_with_plugin(resource) })
    end
  end
end