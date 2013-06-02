class MarcDatum < ActiveRecord::Base
  attr_accessible :book_submission_id, :value, :marc_field_id

  belongs_to :book_submission
  belongs_to :marc_field
end
