json.grandham_id @book.grandham_id
@book.details.each do |key, value|
  json.set!(key, value)
end