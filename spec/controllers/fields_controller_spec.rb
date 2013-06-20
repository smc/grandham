require 'spec_helper'

describe FieldsController do
  before(:all) do
    FactoryGirl.create :field, name: 'ISBN', short_id: 'isbn'
  end
  describe "GET show" do
    it "should return http_success" do
      get :show, id: 'isbn', format: :json
      response.should be_success
    end

    it "should find correct field" do
      get :show, id: 'isbn', format: :json
      assigns[:field].should eq Field.find_by_short_id('isbn')
    end

    it "should contain field name" do
      get :show, id: 'isbn', format: :json
      response.should render_template 'fields/show'
    end
  end
end
