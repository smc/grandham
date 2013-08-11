class Publication < ActiveRecord::Base
  attr_accessible :book_id, :publisher_id

  belongs_to :publisher
  belongs_to :book
end
