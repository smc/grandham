# frozen_string_literal: true

class AuthorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :language
  set_id :grandham_id
end
