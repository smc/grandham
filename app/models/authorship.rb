# frozen_string_literal: true

class Authorship < ApplicationRecord
  belongs_to :author
  belongs_to :book
end
