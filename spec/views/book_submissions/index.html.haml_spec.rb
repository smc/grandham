require 'spec_helper'

describe "book_submissions/index" do
  before(:each) do
    assign(:book_submissions, [
      stub_model(BookSubmission,
        :book_id => 1
      ),
      stub_model(BookSubmission,
        :book_id => 1
      )
    ])
  end

  it "renders a list of book_submissions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
