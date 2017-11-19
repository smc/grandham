# frozen_string_literal: true

class Publication < ApplicationRecord
  #

  belongs_to :publisher
  belongs_to :book
end
