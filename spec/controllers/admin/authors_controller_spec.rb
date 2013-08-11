require 'spec_helper'

describe Admin::AuthorsController do
  before(:all) do
    @language = FactoryGirl.create(:language)
    10.times { |n| @language.authors.create(name: "ABCD #{n}") }
  end

  describe "GET index" do
    before(:each) do
      get :index, language_id: @language.short_code
    end

    it "should return http_success" do
      expect(response).to be_success
    end

    it "should assign @authors with all authors of current language" do
      expect(assigns[:authors].sort).to eq @language.authors.sort
    end
  end

  describe "GET edit" do
    before(:each) do
      @author = FactoryGirl.create(:author, language_id: @language.id)
      get :edit, language_id: @language.short_code, id: @author.grandham_id
    end

    it "should return http_success" do
      expect(response).to be_success
    end

    it "should assign @author" do
      expect(assigns[:author]).to eq @author
    end
  end

  describe "PUT update" do
    before(:each) do
      @author = FactoryGirl.create(:author, language_id: @language.id)
      params = { name: 'Uniq sample plublisher name' }
      put :update, language_id: @language.short_code, id: @author.grandham_id, author: params
    end

    it "should redirect" do
      expect(response).to be_redirect
    end

    it "should assign @author" do
      expect(@author.reload.name).to eq 'Uniq sample plublisher name'
    end
  end
end
