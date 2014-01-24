require 'spec_helper'

describe SearchesController do
  describe "show" do
    context "Books search" do
      it "should return http_success" do
        get :books

        expect(response).to be_success
      end
    end

    context "Authors search" do
      it "should return http_success" do
        get :authors

        expect(response).to be_success
      end
    end

    context "Libraries search" do
      it "should return http_success" do
        get :libraries

        expect(response).to be_success
      end
    end

    context "Publishers search" do
      it "should return http_success" do
        get :publishers

        expect(response).to be_success
      end
    end

    xit "should invoke Search.new" do
      Search.any_instance.should_receive(:results).once

      get :show, query: 'Hello World'
    end
  end
end
