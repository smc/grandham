class Authorship < ActiveRecord::Base
  attr_accessible :author_id, :book_submission_id

  belongs_to :author
  belongs_to :book_submission
end
