require 'spec_helper'

describe Admin::ReviewsController do

  describe "show" do
    it "should return http_success" do
      get :show, language_id: FactoryGirl.create(:language).short_code
      expect(response).to be_success
    end
  end
end
