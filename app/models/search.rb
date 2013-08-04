class Search

  RESOURCES = [ Submission ]

  def initialize(query)
    @query = query
  end

  def to_hash
    sanitize Hash[@query.strip.split(';').collect{ |segment| segment.split(':') }]
  end

  def sanitize(hash)
    {}.tap { |h| hash.each { |key, val| h[key.strip] = val.strip } }
  end

  def is_a_specific_query?
    @query =~ /\S*:.*\S+;/
  end

  def search_term_for(resource)
    is_a_specific_query? ? to_hash[resource.to_s.downcase] : @query
  end

  def search(resource)
    resource.search { fulltext search_term_for(resource) }.results
  end

  def results
    RESOURCES.inject({}) do |result_hash, resource|
      result_hash.merge!({ resource.to_s.downcase => search(resource) })
    end
  end
end