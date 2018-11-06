# frozen_string_literal: true

require "spec_helper"

describe SearchesController do
  describe "show" do
    context "Books search" do
      it "returns http_success" do
        get :books

        expect(response).to be_successful
      end
    end

    context "Authors search" do
      it "returns http_success" do
        get :authors

        expect(response).to be_successful
      end
    end

    context "Libraries search" do
      it "returns http_success" do
        get :libraries

        expect(response).to be_successful
      end
    end

    context "Publishers search" do
      it "returns http_success" do
        get :publishers

        expect(response).to be_successful
      end
    end

    xit "should invoke Search.new" do
      expect_any_instance_of(Search).to receive(:results).once

      get :show, params: { query: "Hello World" }
    end
  end
end
