require 'spec_helper'

describe Submission do
  before(:all) do
    @book = FactoryGirl.create(:book)
  end

  describe "process_associated_records" do
    before(:each) do
      @submission = FactoryGirl.create :submission
    end

    context "duplicate authors" do
      it "should not create duplicate authors" do
        @submission.authors << FactoryGirl.create(:author, name: 'ABC Author')

        submission = Submission.new title: 'Hello World'
        submission.authors.build name: 'ABC Author'

        -> {
          submission.save
        }.should_not change { Author.count }.by 1
      end
    end

    context "duplicate publishers" do
      it "should not create duplicate publishers" do
        @submission.publishers << FactoryGirl.create(:publisher, name: 'ABC Publisher')

        submission = Submission.new title: 'Hello World'
        submission.publishers.build name: 'ABC Publisher'

        -> {
          submission.save
        }.should_not change { Publisher.count }.by 1
      end
    end
  end

  describe "details" do

    it "should remove restricted keys from the record" do
      expect(@book.approved_submission.details[:id]).to be_nil
    end

    it "should not remove non-restricted keys from the record" do
      expect(@book.approved_submission.details[:book_id]).not_to be_nil
    end
  end

  describe "self.initialize_with_data" do
    it "should intialize Submission record with pre-assigned data" do
      submission = Submission.initialize_with_data(@book)

      expect(submission.title).to eq @book.approved_submission.title
      expect(submission.year).to eq @book.approved_submission.year
      expect(submission.authors.first.name).to eq @book.approved_submission.authors.first.name
    end
  end

  describe "set_reviewed!" do
    it "should set reviewed to false by default" do
      submission = FactoryGirl.create :submission
      expect(submission.reviewed?).to be_false
    end

    it "should mark submission as reviewed" do
      submission = FactoryGirl.create :submission
      submission.set_reviewed!

      expect(submission.reviewed?).to be_true
    end
  end

  describe "set_approved!" do
    it "should set approved to false by default" do
      submission = FactoryGirl.create :submission
      expect(submission.approved?).to be_false
    end

    it "should mark submission as approved" do
      submission = FactoryGirl.create :submission
      submission.set_approved!

      expect(submission.approved?).to be_true
    end
  end

end
