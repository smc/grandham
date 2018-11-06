# frozen_string_literal: true

require "spec_helper"

describe AuthorsController do
  describe "index" do
    it "returns http_success" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "show" do
    it "returns http_success" do
      get :index, params: { id: FactoryBot.create(:author) }
      expect(response).to be_successful
    end
  end
end
