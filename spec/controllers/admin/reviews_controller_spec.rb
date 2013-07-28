require 'spec_helper'

describe Admin::ReviewsController do
  before(:each) do
    @language = FactoryGirl.create(:language)
    book = FactoryGirl.create :book
    @submission = book.submissions.first
  end

  describe "index" do
    it "should return http_success" do
      get :index, language_id: @language
      expect(response).to be_success
    end
  end

  describe "show" do
    it "should return http_success" do
      get :show, language_id: @language, id: @submission
      expect(response).to be_success
    end
  end

  describe "approve" do
    it "should approve the submission" do
      post :approve, language_id: @language, id: @submission
      expect(@submission.reload.reviewed?).to be_true
      expect(@submission.reload.approved?).to be_true
    end

    it "should redirect to reviews list" do
      post :approve, language_id: @language, id: @submission
      expect(response).to redirect_to  language_admin_reviews_path(language_id: @language)
    end
  end

  describe "archive" do
    it "should archive the submission" do
      post :archive, language_id: @language, id: @submission
      expect(@submission.reload.reviewed?).to be_true
      expect(@submission.reload.approved?).to be_false
    end

    it "should redirect to reviews list" do
      post :approve, language_id: @language, id: @submission
      expect(response).to redirect_to  language_admin_reviews_path(language_id: @language)
    end
  end
end