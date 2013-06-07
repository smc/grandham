require 'spec_helper'

describe "publishers/index" do
  before(:each) do
    assign(:publishers, [
      stub_model(Publisher,
        :name => "MyText"
      ),
      stub_model(Publisher,
        :name => "MyText"
      )
    ])
  end

  it "renders a list of publishers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
