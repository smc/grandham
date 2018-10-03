# frozen_string_literal: true

class Availability < ApplicationRecord
  belongs_to :library
  belongs_to :book
end
