require 'spec_helper'

describe Admin::PublishersController do
  before(:all) do
    @language = FactoryGirl.create(:language)
    10.times { |n| @language.publishers.create(name: "ABCD #{n}", place: 'Sample Place') }
  end

  describe "GET index" do
    it "should return http_success" do
      get :index, language_id: @language.short_code

      expect(response).to be_success
    end

    it "should fill @publishers will all publishers of current language" do
      get :index, language_id: @language.short_code

      expect(assigns[:publishers].sort).to eq @language.publishers.sort
    end
  end
end
