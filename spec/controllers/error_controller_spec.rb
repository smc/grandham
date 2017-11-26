# frozen_string_literal: true

require 'spec_helper'

describe ErrorController do
  describe "GET 'access_denied'" do
    it 'returns http success' do
      get 'access_denied'
      expect(response).to be_success
    end
  end
end
