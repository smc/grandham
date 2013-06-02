json.books @books do |json, book|
  json.(book, :grandham_id)
  json.language book.language.short_code

  json.data book.approved_submission.marc_data do |datum|
    json.set! datum.marc_field.name, datum.value
  end
end