require 'spec_helper'

describe Admin::ReviewsController do
  before(:each) do
    @language = FactoryGirl.create(:language)
  end

  describe "index" do
    it "should return http_success" do
      get :index, language_id: @language
      expect(response).to be_success
    end
  end
end