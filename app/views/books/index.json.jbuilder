json.books @books do |json, book|
  json.(book, :grandham_id)
  json.language book.language.short_code

  json.data book.approved_submission.data do |datum|
    json.set! datum.field.short_id, datum.value
  end
end