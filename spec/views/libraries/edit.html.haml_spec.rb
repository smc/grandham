require 'spec_helper'

describe "libraries/edit" do
  before(:each) do
    @library = assign(:library, stub_model(Library,
      :name => "MyText",
      :grandham_id => "MyString",
      :language_id => 1
    ))
  end

  it "renders the edit library form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", library_path(@library), "post" do
      assert_select "textarea#library_name[name=?]", "library[name]"
      assert_select "input#library_grandham_id[name=?]", "library[grandham_id]"
      assert_select "input#library_language_id[name=?]", "library[language_id]"
    end
  end
end
