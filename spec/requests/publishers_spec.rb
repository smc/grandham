# frozen_string_literal: true

require 'spec_helper'

describe 'Publishers' do
  describe 'GET /publishers' do
    it 'works! (now write some real specs)' do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get publishers_path
      expect(response.status).to be(200)
    end
  end
end
