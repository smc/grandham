json.(@book, :grandham_id)

json.data @book.approved_submission.marc_data do |datum|
  json.set! datum.marc_field.name, datum.value
end