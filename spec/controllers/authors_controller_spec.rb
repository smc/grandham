require 'spec_helper'

describe AuthorsController do
  describe "index" do
    it "should return http_success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "show" do
    it "should return http_success" do
      get :index, id: FactoryGirl.create(:author)
      expect(response).to be_success
    end
  end
end
