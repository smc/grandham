require 'spec_helper'

describe "book_submissions/new" do
  before(:each) do
    assign(:book_submission, stub_model(BookSubmission,
      :book_id => 1
    ).as_new_record)
  end

  it "renders new book_submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", book_submissions_path, "post" do
      assert_select "input#book_submission_book_id[name=?]", "book_submission[book_id]"
    end
  end
end
