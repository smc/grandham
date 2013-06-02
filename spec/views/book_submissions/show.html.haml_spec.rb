require 'spec_helper'

describe "book_submissions/show" do
  before(:each) do
    @book_submission = assign(:book_submission, stub_model(BookSubmission,
      :book_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
