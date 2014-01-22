require 'spec_helper'

describe SearchesController do
  describe "show" do
    it "should return http_success" do
      get :show

      expect(response).to be_success
    end

    xit "should invoke Search.new" do
      Search.any_instance.should_receive(:results).once

      get :show, query: 'Hello World'
    end
  end
end
