require 'spec_helper'

describe "book_submissions/edit" do
  before(:each) do
    @book_submission = assign(:book_submission, stub_model(BookSubmission,
      :book_id => 1
    ))
  end

  it "renders the edit book_submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", book_submission_path(@book_submission), "post" do
      assert_select "input#book_submission_book_id[name=?]", "book_submission[book_id]"
    end
  end
end
