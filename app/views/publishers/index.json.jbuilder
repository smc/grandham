# frozen_string_literal: true

json.publishers @publishers do |json, publisher|
  json.grandham_id publisher.grandham_id
  json.name publisher.name
  json.place publisher.place
end
