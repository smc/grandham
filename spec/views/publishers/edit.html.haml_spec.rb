require 'spec_helper'

describe "publishers/edit" do
  before(:each) do
    @publisher = assign(:publisher, stub_model(Publisher,
      :name => "MyText"
    ))
  end

  it "renders the edit publisher form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", publisher_path(@publisher), "post" do
      assert_select "textarea#publisher_name[name=?]", "publisher[name]"
    end
  end
end
