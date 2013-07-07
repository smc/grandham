require 'spec_helper'

describe SubmissionsController do
  before(:all) do
    @language = FactoryGirl.create :language
    @submission = FactoryGirl.create :submission
  end

  describe "create submission" do
    context "new book" do

      it "should create a book if params[:book_id] doesn't exist" do
        -> {
          post :create, submission: { title: 'Hello World' }, language_id: @language.short_code
        }.should change { Book.count }.by 1
      end

      it "should create a submission for the correct book" do
        -> {
          post :create, submission: { title: 'Hello World' }, language_id: @language.short_code
        }.should change { Submission.count }.by 1

        expect(assigns[:submission].book).not_to be_nil
      end

      it "should not create book if submission is invalid" do
        -> {
          post :create, language_id: @language.short_code
        }.should_not change { Book.count }.by 1
      end

      it "should redirect to root_url if successful" do
        post :create, submission: { title: 'Hello World' }, language_id: @language.short_code
        response.should redirect_to root_url
      end

      # All submissions are approved for now
      xit "should not change the default 'approved' value of submission" do
        post :create, title: 'Hello World', language_id: @language.short_code
        expect(assigns[:submission].approved?).to be_false
      end
    end
  end
end