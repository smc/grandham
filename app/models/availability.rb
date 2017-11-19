# frozen_string_literal: true

class Availability < ApplicationRecord
  # attr_accessible :book_id, :library_id

  belongs_to :library
  belongs_to :book
end
