require 'spec_helper'

describe "submissions/edit" do
  before(:each) do
    @submission = assign(:submission, stub_model(Submission,
      :book_id => 1,
      :approved => false
    ))
  end

  it "renders the edit submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", submission_path(@submission), "post" do
      assert_select "input#submission_book_id[name=?]", "submission[book_id]"
      assert_select "input#submission_approved[name=?]", "submission[approved]"
    end
  end
end
