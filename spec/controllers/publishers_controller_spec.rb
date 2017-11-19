# frozen_string_literal: true

require 'spec_helper'

describe PublishersController do
  describe 'index' do
    it 'returns http_success' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'show' do
    it 'returns http_success' do
      get :index, params: { id: FactoryGirl.create(:publisher) }
      expect(response).to be_success
    end
  end
end
