require 'spec_helper'

describe SubmissionsController do

  before(:each) do
    @book = FactoryGirl.create :book
  end

  def submission_attributes
    { submission: { title: 'Hello World' }, language_id: @book.language.short_code }
  end

  describe "new submission to an existing book" do
    it "should return http_success" do
      get :new, book: @book

      expect(response).to be_success
    end

    it "should get initialized with pre-assigned data" do
      get :new, book_id: @book.grandham_id

      expect(assigns[:submission].details).to eq Submission.initialize_with_data(@book).details
    end
  end

  describe "create submission" do

    describe "associated records" do
      context "author" do
        context "exists" do
          xit "should not create new author" do
            -> {
              post :create, submission: { title: 'Hello World', authors_attributes: [ FactoryGirl.attributes_for(:author, name: 'Ezhuthachan') ] }, language_id: @book.language.short_code
            }.should_not change { Author.count }.by 1
          end
        end

        context "doesn't exist" do
          xit "should create new author" do
            -> {
              attrs = submission_attributes.merge()
              post :create, submission: { title: 'Hello World', authors_attributes: [ FactoryGirl.attributes_for(:author, name: 'Ezhuthachan') ] }, language_id: @book.language.short_code
            }.should change { Author.count }.by 1
          end
        end
      end

      context "publisher" do
        context "exists" do
          xit "should not create new publisher" do
            -> {
              post :create, submission: { title: 'Hello World', publishers_attributes: [ FactoryGirl.attributes_for(:publisher, name: 'Sample Publisher') ] }, language_id: @book.language.short_code
            }.should_not change { Publisher.count }.by 1
          end
        end

        context "doesn't exist" do
          xit "should create new publisher" do
            -> {
              post :create, submission: { title: 'Hello World', publishers_attributes: [ FactoryGirl.attributes_for(:publisher, name: 'Sample Publisher') ] }, language_id: @book.language.short_code
            }.should change { Publisher.count }.by 1
          end
        end
      end
    end

    context "new book" do

      it "should create a book if params[:book_id] doesn't exist" do
        -> {
          post :create, submission: { title: 'Hello World' }, language_id: @book.language.short_code
        }.should change { Book.count }.by 1
      end

      it "should create a submission for the correct book" do
        -> {
          post :create, submission: { title: 'Hello World' }, language_id: @book.language.short_code
        }.should change { Submission.count }.by 1

        expect(assigns[:submission].book).not_to be_nil
      end

      it "should not create book if submission is invalid" do
        -> {
          post :create, language_id: @book.language.short_code
        }.should_not change { Book.count }.by 1
      end

      it "should redirect to root_url if successful" do
        post :create, submission: { title: 'Hello World' }, language_id: @book.language.short_code
        response.should redirect_to root_url
      end

      # All submissions are approved for now
      xit "should not change the default 'approved' value of submission" do
        post :create, title: 'Hello World', language_id: @book.language.short_code
        expect(assigns[:submission].approved?).to be_false
      end
    end
  end
end