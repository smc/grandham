require 'spec_helper'

describe "libraries/index" do
  before(:each) do
    assign(:libraries, [
      stub_model(Library,
        :name => "MyText",
        :grandham_id => "Grandham",
        :language_id => 1
      ),
      stub_model(Library,
        :name => "MyText",
        :grandham_id => "Grandham",
        :language_id => 1
      )
    ])
  end

  it "renders a list of libraries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Grandham".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
