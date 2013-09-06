require 'spec_helper'

describe Admin::ReviewsController do
  before(:each) do
    @language = FactoryGirl.create(:language)
    @user =  FactoryGirl.create :user, role: 'super_admin'
    sign_in @user
    p @user.role
  end

  describe "index" do
    it "should return http_success" do

      get :index, language_id: @language
      p response
      expect(response).to be_success
    end
  end
end