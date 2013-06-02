require 'spec_helper'

describe BooksController do
  before(:each) do
    @book = FactoryGirl.create :book
  end

  describe "GET index" do
    it "assigns all books as @books" do
      get :index
      assigns(:books).should be_a Array
      assigns(:books).should include(@book)
    end

    it "should return http success on json request" do
      get :index, format: :json
      response.should be_success
    end
  end

  describe "GET show" do
    it "should return http success on json request" do
      get :show, id: @book, format: :json
      response.should be_success
    end

    it "should assign book as @book" do
      get :show, id: @book
      assigns(:book).should eq @book
    end
  end
end