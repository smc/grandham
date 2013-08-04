require 'spec_helper'

describe Search do
  let(:search) { Search.new('author: test; title: test;') }

  describe "query_is_specific?" do
    it "should return true if query is specific" do
      expect(search.query_is_specific?).to be_true
    end

    it "should return false if query is not specific" do
      s = Search.new('hello world')
      expect(s.query_is_specific?).to be_false
    end
  end

  describe "to_hash" do
    it "should return a hash" do
      expect(search.to_hash).to be_a Hash
    end

    it "should have exact number of key-value pairs based on the query" do
      expect(search.to_hash.keys.count).to eq 2
      expect(search.to_hash.values.count).to eq 2
    end
  end

  describe "sanitize" do
    it "should strip both keys and values of a hash" do
      hash = { '   hello ' => '  world ', 'test  ' => ' 1 ' }

      expect(Search.new('sample').sanitize(hash)['hello']).to eq 'world'
    end
  end
end