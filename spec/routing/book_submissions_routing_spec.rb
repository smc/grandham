require "spec_helper"

describe BookSubmissionsController do
  describe "routing" do

    it "routes to #index" do
      get("/book_submissions").should route_to("book_submissions#index")
    end

    it "routes to #new" do
      get("/book_submissions/new").should route_to("book_submissions#new")
    end

    it "routes to #show" do
      get("/book_submissions/1").should route_to("book_submissions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/book_submissions/1/edit").should route_to("book_submissions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/book_submissions").should route_to("book_submissions#create")
    end

    it "routes to #update" do
      put("/book_submissions/1").should route_to("book_submissions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/book_submissions/1").should route_to("book_submissions#destroy", :id => "1")
    end

  end
end
