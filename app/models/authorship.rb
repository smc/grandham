# frozen_string_literal: true

class Authorship < ApplicationRecord
  # attr_accessible :author_id, :book_id

  belongs_to :author
  belongs_to :book
end
