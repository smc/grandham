# frozen_string_literal: true

require "spec_helper"

describe PublishersController do
  describe "routing" do
    it "routes to #index" do
      expect(get("/publishers")).to route_to("publishers#index")
    end

    it "routes to #new" do
      expect(get("/publishers/new")).to route_to("publishers#new")
    end

    it "routes to #show" do
      expect(get("/publishers/1")).to route_to("publishers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get("/publishers/1/edit")).to route_to("publishers#edit", id: "1")
    end

    it "routes to #create" do
      expect(post("/publishers")).to route_to("publishers#create")
    end

    it "routes to #update" do
      expect(put("/publishers/1")).to route_to("publishers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete("/publishers/1")).to route_to("publishers#destroy", id: "1")
    end
  end
end
