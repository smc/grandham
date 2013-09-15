class Availability < ActiveRecord::Base
  attr_accessible :book_id, :library_id

  belongs_to :library
  belongs_to :book
end