class MarcDatum < ActiveRecord::Base
  attr_accessible :submission_id, :value, :marc_field_id

  belongs_to :submission
  belongs_to :marc_field
end
