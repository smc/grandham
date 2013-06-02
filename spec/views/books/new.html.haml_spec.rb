require 'spec_helper'

describe "books/new" do
  before(:each) do
    assign(:book, stub_model(Book,
      :grandham_id => "MyString",
      :language_id => 1
    ).as_new_record)
  end

  it "renders new book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", books_path, "post" do
      assert_select "input#book_grandham_id[name=?]", "book[grandham_id]"
      assert_select "input#book_language_id[name=?]", "book[language_id]"
    end
  end
end
