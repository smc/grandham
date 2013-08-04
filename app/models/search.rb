class Search
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

  def results
    is_a_specific_query? ? to_hash : @query
  end
end