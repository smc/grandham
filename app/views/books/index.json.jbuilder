# frozen_string_literal: true

json.books @books do |json, book|
  json.grandham_id book.grandham_id
  book.details.each do |key, value|
    json.set!(key, value)
  end
end
