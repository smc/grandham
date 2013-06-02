class MarcDatum < ActiveRecord::Base
  attr_accessible :book_submission_id, :field, :value

  belongs_to :book_submission
end
