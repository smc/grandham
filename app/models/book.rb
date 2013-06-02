class Book < ActiveRecord::Base
  attr_accessible :grandham_id, :language_id

  belongs_to :language
  has_one :approved_submission, class_name: 'BookSubmission', conditions: ['approved = true']
end
