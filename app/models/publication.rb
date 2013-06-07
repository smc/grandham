class Publication < ActiveRecord::Base
  attr_accessible :book_submission_id, :publisher_id

  belongs_to :publisher
  belongs_to :book_submission
end
