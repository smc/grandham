class Publication < ActiveRecord::Base
  attr_accessible :submission_id, :publisher_id

  belongs_to :publisher
  belongs_to :submission
end
