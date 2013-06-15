language = Language.where(name: 'Malayalam', short_code: 'ML').first_or_create!

fields = ["ISBN", "DDC", "Publisher subject category", "Original language if translation",
          "Book No.1", "Book No.2", "Author 1, Personal, Main", "Author 1, Personal, Main - Role",
          "Author 1, Corporate, Main", "Author 2, Personal, Added", "Author 2, Personal, Added - Role",
          "Author 3, Personal, Added", "Author 3, Personal, Added - Role", "Title (sub-title included)",
          "Volume/Part", "Edition", "SOR (Statement of responsibility- Author", "Real Name- Author",
          "Publisher", "Place", "Year", "Series", "Series No.", "Number of Volumes", "Pages", "Price",
          "Dimensions (LengthXwidth)", "Subject KW1", "Subject KW2", "Subject KW3", "Note/Abstract",
          "Rewies/ comments by Readers", "Title Org", "Preface", "Illustrator", "Length", "Location"]

fields.each do |field|
  MarcField.create name: field
end

books = JSON.load(open(File.join(Rails.root, '../', 'books.json')).read)
import_progress_bar = ProgressBar.create(:format => '%a |%b>%i| %p%% %t', :total => books.count)

import_data_map = {
  "DDC"         => "DDC",
  "Title"       => "Title (sub-title included)",
  "Author"      => "Author 1, Personal, Main",
  "Titleorg"    => "Title Org",
  "Vol"         => "Volume/Part",
  "Edition"     => "Edition",
  "Series"      => "Series",
  "Year"        => "Year",
  "publisher"   => "Publisher",
  "Preface"     => "Preface",
  "Illustrator" => "Illustrator",
  "Pages"       => "Pages",
  "Length"      => "Length",
  "Price"       => "Price",
  "Note"        => "Note/Abstract",
  "Location"    => "Location"
}

books.each do |book|
  import_progress_bar.increment

  book_obj = language.books.create
  submission = book_obj.submissions.create approved: true
  (book.keys - ["id", "Language"]).each do |key|
    unless book[key] == "None"
      submission.marc_data.create value: book[key], marc_field_id: MarcField.find_by_name(import_data_map[key]).id
    end
  end
end