class BookSubmission < ActiveRecord::Base
  attr_accessible :book_id, :approved

  belongs_to :book
  has_many :marc_data
end