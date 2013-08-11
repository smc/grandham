class Datum < ActiveRecord::Base
  attr_accessible :field_id, :book_id, :value

  belongs_to :book
  belongs_to :field
end