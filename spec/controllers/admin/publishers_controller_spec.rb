require 'spec_helper'

describe Admin::PublishersController do
  before(:all) do
    @language = FactoryGirl.create(:language)
    10.times { |n| @language.publishers.create(name: "ABCD #{n}", place: 'Sample Place') }
  end

  describe "GET index" do
    before(:each) do
      get :index, language_id: @language.short_code
    end

    it "should return http_success" do
      expect(response).to be_success
    end

    it "should assign @publishers with all publishers of current language" do
      expect(assigns[:publishers].sort).to eq @language.publishers.sort
    end
  end

  describe "GET edit" do
    before(:each) do
      @publisher = FactoryGirl.create(:publisher, language_id: @language.id)
      get :edit, language_id: @language.short_code, id: @publisher.grandham_id
    end

    it "should return http_success" do
      expect(response).to be_success
    end

    it "should assign @publisher" do
      expect(assigns[:publisher]).to eq @publisher
    end
  end

  describe "PUT update" do
    before(:each) do
      @publisher = FactoryGirl.create(:publisher, language_id: @language.id)
      params = { name: 'Uniq sample plublisher name', place: 'TEST PLACE' }
      put :update, language_id: @language.short_code, id: @publisher.grandham_id, publisher: params
    end

    it "should redirect" do
      expect(response).to be_redirect
    end

    it "should assign @publisher" do
      expect(@publisher.reload.name).to eq 'Uniq sample plublisher name'
    end
  end

  describe "POST create" do
    before(:each) do
      @params = FactoryGirl.attributes_for(:publisher, language_id: @language.id)
    end

    it "should redirect" do
      post :create, language_id: @language.short_code, publisher: @params

      expect(response).to be_redirect
    end

    it "should add a new publisher" do
      -> {
        post :create, language_id: @language.short_code, publisher: @params
      }.should change{ @language.publishers.count }.by(1)
    end
  end
end