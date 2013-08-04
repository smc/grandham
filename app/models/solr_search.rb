class SolrSearch
  def initialize(resource, search_object)
    @resource = resource
    @search = search_object
  end

  def do_specific_search
    []
  end

  def normal_keyword_search
    query = @search.query

    if @resource == Submission
      @resource.search do
        fulltext query
        all_of do
          with(:approved, 1)
        end
      end.results
    else
      @resource.search { fulltext query }.results
    end
  end

  def results
    if @search.query_is_specific?
      do_specific_search
    else
      normal_keyword_search
    end
  end
end