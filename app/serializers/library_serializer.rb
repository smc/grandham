# frozen_string_literal: true

class LibrarySerializer
  include FastJsonapi::ObjectSerializer
  set_id :grandham_id
  attributes :name, :place, :language
end
