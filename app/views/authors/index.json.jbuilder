# frozen_string_literal: true

json.authors @authors do |json, author|
  json.grandham_id author.grandham_id
  json.name author.name
end
