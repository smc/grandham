class Datum < ActiveRecord::Base
  attr_accessible :field_id, :submission_id, :value

  belongs_to :submission
  belongs_to :field
end