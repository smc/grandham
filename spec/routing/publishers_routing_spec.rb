require "spec_helper"

describe PublishersController do
  describe "routing" do

    it "routes to #index" do
      get("/publishers").should route_to("publishers#index")
    end

    it "routes to #new" do
      get("/publishers/new").should route_to("publishers#new")
    end

    it "routes to #show" do
      get("/publishers/1").should route_to("publishers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/publishers/1/edit").should route_to("publishers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/publishers").should route_to("publishers#create")
    end

    it "routes to #update" do
      put("/publishers/1").should route_to("publishers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/publishers/1").should route_to("publishers#destroy", :id => "1")
    end

  end
end
