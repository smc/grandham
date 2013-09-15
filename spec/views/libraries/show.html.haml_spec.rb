require 'spec_helper'

describe "libraries/show" do
  before(:each) do
    @library = assign(:library, stub_model(Library,
      :name => "MyText",
      :grandham_id => "Grandham",
      :language_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Grandham/)
    rendered.should match(/1/)
  end
end
