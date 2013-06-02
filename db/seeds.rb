fields = ["ISBN", "DDC", "Publisher subject category", "Original language if translation",
          "Book No.1", "Book No.2", "Author 1, Personal, Main", "Author 1, Personal, Main - Role",
          "Author 1, Corporate, Main", "Author 2, Personal, Added", "Author 2, Personal, Added - Role",
          "Author 3, Personal, Added", "Author 3, Personal, Added - Role", "Title (sub-title included)",
          "Volume/Part", "Edition", "SOR (Statement of responsibility- Author", "Real Name- Author",
          "Publisher", "Place", "Year", "Series", "Series No.", "Number of Volumes", "Pages", "Price",
          "Dimensions (LengthXwidth)", "Subject KW1", "Subject KW2", "Subject KW3", "Note/Abstract",
          "Rewies/ comments by Readers"]

fields.each do |field|
  MarcField.create name: field
end