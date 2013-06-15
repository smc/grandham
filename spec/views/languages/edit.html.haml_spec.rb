require 'spec_helper'

describe "languages/edit" do
  before(:each) do
    @language = assign(:language, stub_model(Language,
      :name => "MyString",
      :short_code => "MyText"
    ))
  end

  it "renders the edit language form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", language_path(@language), "post" do
      assert_select "textarea#language_name[name=?]", "language[name]"
      assert_select "input#language_short_code[name=?]", "language[short_code]"
    end
  end
end
