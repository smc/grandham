require 'spec_helper'

describe Admin::ReviewsController do
  before(:all) do
    @language = FactoryGirl.create(:language)
    @submission = FactoryGirl.create(:submission)
  end

  describe "index" do
    it "should return http_success" do
      get :index, language_id: @language.short_code
      expect(response).to be_success
    end
  end

  describe "show" do
    it "should return http_success" do
      get :show, language_id: @language.short_code, id: @submission.id
      expect(response).to be_success
    end
  end
end
