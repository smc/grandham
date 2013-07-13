require 'spec_helper'

describe Submission do
  before(:all) do
    @book = FactoryGirl.create(:book)
    @submission = FactoryGirl.create :submission, approved: true, book: @book
    @submission.authors << [ FactoryGirl.create(:author) ]
    @submission.publishers << [ FactoryGirl.create(:publisher) ]
  end

  describe "details" do

    it "should remove restricted keys from the record" do
      expect(@submission.details[:id]).to be_nil
    end

    it "should not remove non-restricted keys from the record" do
      expect(@submission.details[:book_id]).not_to be_nil
    end
  end

  describe "self.initialize_with_data" do
    it "should intialize Submission record with pre-assigned data" do
      submission = Submission.initialize_with_data(@book)

      expect(submission.title).to eq @submission.title
      expect(submission.year).to eq @submission.year
      expect(submission.authors.first.name).to eq @submission.authors.first.name
    end
  end
end
