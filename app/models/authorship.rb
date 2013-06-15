class Authorship < ActiveRecord::Base
  attr_accessible :author_id, :submission_id

  belongs_to :author
  belongs_to :submission
end
